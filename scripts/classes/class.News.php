<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Entity.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.TableImages.php';

class News extends Entity
{
   const INFO_SCHEME  = 2;
   const MAIN_SCHEME  = 3;
   const OTHER_SCHEME = 4;

   const PHOTO_FLD            = 'photo_id';
   const TITLE_FLD            = 'meta_title';
   const PHOTOS_FLD           = 'photos';
   const KEYWORDS_FLD         = 'meta_keywords';
   const TEXT_HEAD_FLD        = 'head';
   const TEXT_BODY_FLD        = 'body';
   const DESCRIPTION_FLD      = 'description';
   const PUBLICATION_DATE_FLD = 'publication_date';
   const META_DESCRIPTION_FLD = 'meta_description';

   const TABLE = 'news';

   const LAST_VIEWED_ID = 'last_viewed_news_id';

   const NEWS_ON_PAGE = 6;

   public function __construct()
   {
      parent::__construct();
      $this->fields = Array(
         $this->idField,
         new Field(
            static::TEXT_HEAD_FLD,
            StrType(150),
            true,
            'Заголовок новости',
            Array(Validate::IS_NOT_EMPTY)
         ),
         new Field(
            static::TEXT_BODY_FLD,
            TextType(),
            true,
            'Текст новости',
            Array(Validate::IS_NOT_EMPTY)
         ),
         new Field(
            static::DESCRIPTION_FLD,
            StrType(MAX_SHORT_DESC_LEN, 'Описание новости не может превышать ' . MAX_SHORT_DESC_LEN . ' символов.'),
            true,
            'Описание новости',
            Array(Validate::IS_NOT_EMPTY)
         ),
         new Field(
            static::PUBLICATION_DATE_FLD,
            TimestampType(),
            false
         ),
         new Field(
            static::PHOTO_FLD,
            IntType(),
            true
         ),
         new Field(
            static::KEYWORDS_FLD,
            TextType(),
            true
         ),
         new Field(
            static::META_DESCRIPTION_FLD,
            TextType(),
            true
         ),
         new Field(
            static::TITLE_FLD,
            StrType(125),
            true,
            'Title страницы',
            Array(Validate::IS_NOT_EMPTY)
         )
      );
      $this->orderFields =
         Array(static::PUBLICATION_DATE_FLD => new OrderField(static::TABLE, $this->GetFieldByName(static::PUBLICATION_DATE_FLD)));
   }

   public function ModifySample(&$sample)
   {
      if (empty($sample)) return $sample;
      switch ($this->samplingScheme) {
         case static::MAIN_SCHEME:
         case static::INFO_SCHEME:
            $key = $this->ToPrfxNm(static::PHOTOS_FLD);
            $dateKey = $this->ToPrfxNm(static::PUBLICATION_DATE_FLD);
            foreach ($sample as &$set) {
               $date_var = new DateTime($set[$dateKey]);
               $set[$dateKey] = $date_var->format('d-m-Y');
               if ($this->samplingScheme == static::INFO_SCHEME) {
                  $set[$key] = !empty($set[$key]) ? explode(',', $set[$key]) : Array();
               }
            }
            break;

         case static::OTHER_SCHEME:
            $dateKey = $this->ToPrfxNm(static::PUBLICATION_DATE_FLD);
            $textKey = $this->ToPrfxNm(static::TEXT_BODY_FLD);
            foreach ($sample as $key => &$set) {
               $date = new DateTime($set[$dateKey]);
               $set[$textKey] = $this->CutNewsBody($set[$textKey]);
               $set[$dateKey] = $date->format('d-m-Y');
            }
            $resArr = array_chunk($sample, 3);
            $arr['left_news']  = isset($resArr[0]) ? $resArr[0] : Array();
            $arr['right_news'] = isset($resArr[1]) ? $resArr[1] : Array();
            $sample = $arr;
            break;
      }
   }

   public function SetSelectValues()
   {
      $this->AddOrder(static::PUBLICATION_DATE_FLD, OT_DESC);
      if ($this->TryToApplyUsualScheme()) return;
      $fields = Array();
      switch ($this->samplingScheme) {
         case static::INFO_SCHEME:
            global $_newsImages;
            $fields =
               SQL::PrepareFieldsForSelect(
                  static::TABLE,
                  Array(
                     $this->GetFieldByName(static::ID_FLD),
                     $this->GetFieldByName(static::TEXT_HEAD_FLD),
                     $this->GetFieldByName(static::TEXT_BODY_FLD),
                     $this->GetFieldByName(static::DESCRIPTION_FLD),
                     $this->GetFieldByName(static::PHOTO_FLD),
                     $this->GetFieldByName(static::PUBLICATION_DATE_FLD),
                     $this->GetFieldByName(static::TITLE_FLD),
                     $this->GetFieldByName(static::KEYWORDS_FLD),
                     $this->GetFieldByName(static::META_DESCRIPTION_FLD),
                  )
               );
            $fields[] = ImageSelectSQL($this, $_newsImages, NewsImages::NEWS_FLD);
            break;

         case static::MAIN_SCHEME:
            $fields = SQL::PrepareFieldsForSelect(
               static::TABLE,
               [
                  $this->idField,
                  $this->GetFieldByName(static::TEXT_HEAD_FLD),
                  $this->GetFieldByName(static::DESCRIPTION_FLD)
               ]
            );
            $fields = SQL::PrepareFieldsForSelect(static::TABLE, $this->fields);
            break;

      }
      $fields[] = ImageWithFlagSelectSQL(static::TABLE, $this->GetFieldByName(static::PHOTO_FLD));
      $this->selectFields = SQL::GetListFieldsForSelect($fields);
   }

   public function GetNews($page)
   {
      $all_news = $this->SetSamplingScheme(News::MAIN_SCHEME)->AddLimit(static::NEWS_ON_PAGE, $page * static::NEWS_ON_PAGE)->GetAll();
      $a = ['left', 'middle', 'right'];
      $news['left'] = $news['middle'] = $news['right'] = [];
      for ($i = 0; $i < 3; $i++) {
         for ($j = 0; $j < 2; $j++) {
            $idx = $i + 3 * $j;
            if ($idx >= count($all_news)) break;
            $news[$a[$i]][] = $all_news[$idx];
         }
      }
      return $news;
   }

   public function GetAdminMenu()
   {
      $date = static::PUBLICATION_DATE_FLD;
      $packData = function($aggregate) use($date) {
         return "DATE_FORMAT($aggregate($date), '%Y-%m') as $date";
      };
      $query = SQL::SimpleQuerySelect($packData('MIN'), static::TABLE)
             . ' UNION '
             . SQL::SimpleQuerySelect($packData('MAX'), static::TABLE);
      $resMenu = '';
      try {
         global $db;
         $result = $db->Query($query);
         if (!empty($result[0][static::PUBLICATION_DATE_FLD]) && count($result) == 1) {
            $result[] = $result[0];
         }
         if (count($result) != 2) return $resMenu;
         $date1 = new DateTime($result[0][static::PUBLICATION_DATE_FLD]);
         $date2 = new DateTime($result[1][static::PUBLICATION_DATE_FLD]);
         $printMoth = function($y, $m) {
            return "<li><a href='/admin/news/$y/$m'>" . GetMonthByNumber($m) . "</a></li>";
         };
         while ($date1 <= $date2) {
            $y = $date2->format('Y');
            $m = $date2->format('n');
            $resMenu .= "<ul><li><a href='javascript:void(0)' class='dropdown_head' id='year_$y'>$y</a><ul class='dropdown_block'>";
            do {
               $resMenu .= $printMoth($y, $date2->format('n'));
               $date2->sub(new DateInterval('P1M'));
            } while ($date2->format('n') <= $m - 1 && $date1 <= $date2);
            $resMenu .= '</ul></li></ul>';
         }
      } catch (Exception $e) {}
      return $resMenu;
   }

   public function CreateSearchYM($year, $month)
   {
      $this->search = new Search(self::TABLE);
      $date = DateTime::createFromFormat('Y n', "$year $month");
      $this->search->AddClause(
         CCond(
            CF(static::TABLE, $this->GetFieldByName(static::PUBLICATION_DATE_FLD)),
            new LikeView(CVP('%' . $date->format('Y-m') . '%')),
            'AND',
            ''
         )
      );
      return $this;
   }
}

$_news = new News();
