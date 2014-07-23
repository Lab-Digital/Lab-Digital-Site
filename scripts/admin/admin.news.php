<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.News.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

$level = 1;
$year = !empty($request[2]) ? $request[2] : null;
if (!empty($year)) {
   $level = 2;
   $month = $request[3];
   if (!empty($month)) {
      $smarty->assign('year', $year)
             ->assign('month', $month)
             ->assign('articles', $_news->CreateSearchYM($year, $month)
                                        ->SetSamplingScheme(News::INFO_SCHEME)
                                        ->AddOrder(News::PUBLICATION_DATE_FLD, OT_ASC)
                                        ->GetAll());
   } elseif (empty($_POST['mode']) || $_POST['mode'] != 'Insert') {
      header("Location: /admin/news/$year/1");
      exit;
   }
}

SetLastViewedID(News::LAST_VIEWED_ID);

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $id   = isset($_POST['id']) ? $_POST['id'] : null;

   $head        = isset($post['head'])        ? $post['head'] : null;
   $body        = isset($post['body'])        ? $post['body'] : null;
   $desc        = isset($post['desc'])        ? $post['desc'] : null;
   $title       = isset($post['title'])       ? $post['title'] : null;
   $keywords    = isset($post['keywords'])    ? $post['keywords'] : null;
   $description = isset($post['description']) ? $post['description'] : null;
   $post['params'] = Array(
         News::ID_FLD               => $id,
         News::TEXT_HEAD_FLD        => $head,
         News::TEXT_BODY_FLD        => $body,
         News::DESCRIPTION_FLD      => $desc,
         News::TITLE_FLD            => $title,
         News::KEYWORDS_FLD         => $keywords,
         News::META_DESCRIPTION_FLD => $description
   );
   if ($post['mode'] != 'Insert') {
      $_news->SetLastViewedID($id);
   } else {
      $datetime = new DateTime();
      list($year, $month) = Array($datetime->format('Y'), $datetime->format('n'));
   }
   HandleAdminData($_news, $post, "news/$year/$month");
   SetLastViewedID(News::LAST_VIEWED_ID);
}

$smarty->assign('body', !empty($body) ? $body : '')
       ->assign('head', !empty($head) ? $head : '')
       ->assign('desc', !empty($desc) ? $desc : '')
       ->assign('meta_title', !empty($title) ? $title : '')
       ->assign('meta_keywords', !empty($keywords) ? $keywords : '')
       ->assign('meta_description', !empty($description) ? $description : '')
       ->assign('item_id', !empty($_GET['item_id']) ? $_GET['item_id'] : null)
       ->assign('article_level', $level)
       ->assign('article_menu', $_news->GetAdminMenu())
       ->display('admin.news.tpl');
