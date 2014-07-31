<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.EntityURL.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Image.php';

class Texts extends EntityURL
{
   const ABOUT_TEXT_ID = 1;

   const NAME_FLD             = 'name';
   const HEAD_FLD             = 'head';
   const BODY_FLD             = 'body';
   const PHOTO_FLD            = 'photo_id';
   const TITLE_FLD            = 'meta_title';
   const KEYWORDS_FLD         = 'meta_keywords';
   const DESCRIPTION_FLD      = 'description';
   const META_DESCRIPTION_FLD = 'meta_description';

   const TABLE = 'texts';

   const ABOUT_SCHEME = 2;
   const PROJECTS_SCHEME = 3;
   const MAIN_PROJECTS_SCHEME = 4;

   const LAST_VIEWED_ID = 'last_viewed_projects_id';

   public function __construct()
   {
      parent::__construct();
      $this->fields = Array(
         $this->idField,
         $this->urlField,
         new Field(
            static::NAME_FLD,
            StrType(100),
            false
         ),
         new Field(
            static::HEAD_FLD,
            StrType(150),
            true,
            'Название проекта',
            Array(Validate::IS_NOT_EMPTY)
         ),
         new Field(
            static::BODY_FLD,
            TextType(),
            true
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
   }

   private function _SetProjectSearch()
   {
      $this->CheckSearch()->search->AddClause(
         CCond(
            CF(static::TABLE, $this->GetFieldByName(static::ID_FLD)),
            CVP(static::ABOUT_TEXT_ID),
            cAND,
            opGT
         )
      );
      return $this;
   }

   public function SetSelectValues()
   {
      $fields = $this->fields;
      switch ($this->samplingScheme) {
         case static::ABOUT_SCHEME:
            $fields = [$this->GetFieldByName(static::HEAD_FLD), $this->GetFieldByName(static::BODY_FLD)];
            break;

         case static::MAIN_PROJECTS_SCHEME:
            $fields = [$this->idField, $this->urlField, $this->GetFieldByName(static::HEAD_FLD)];
            break;
      }
      $fields = array_merge($fields, [
         $this->GetFieldByName(static::TITLE_FLD),
         $this->GetFieldByName(static::KEYWORDS_FLD),
         $this->GetFieldByName(static::META_DESCRIPTION_FLD)
      ]);
      if ($this->samplingScheme == static::PROJECTS_SCHEME || $this->samplingScheme == static::MAIN_PROJECTS_SCHEME) {
         $this->CheckSearch()->AddLimit(3, 0)->_SetProjectSearch();

      }
      $this->selectFields = SQL::GetListFieldsForSelect(
         array_merge(
            SQL::PrepareFieldsForSelect(static::TABLE, $fields),
            [ImageWithFlagSelectSQL(static::TABLE, $this->GetFieldByName(static::PHOTO_FLD))]
         )
      );
   }

   public function GetProjectByURL($url)
   {
      return $this->_SetProjectSearch()->GetByURL($url);
   }

   protected function GetURLBase()
   {
      return $this->GetFieldByName(static::HEAD_FLD)->GetValue();
   }

}

$_texts = new Texts();
