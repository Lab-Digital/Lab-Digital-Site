<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

SetLastViewedID($obj::LAST_VIEWED_ID);

$head = $body = $desc = $title = $keywords = $description = null;

if (isset($_POST['mode'])) {
   $post = GetPOST(false);
   $id          = isset($post['id'])          ? $post['id']          : null;
   $head        = isset($post['head'])        ? $post['head']        : null;
   $body        = isset($post['body'])        ? $post['body']        : null;
   $desc        = isset($post['desc'])        ? $post['desc']        : null;
   $title       = isset($post['title'])       ? $post['title']       : null;
   $keywords    = isset($post['keywords'])    ? $post['keywords']    : null;
   $description = isset($post['description']) ? $post['description'] : null;

   $post['params'] = Array(
      $obj::ID_FLD               => $id,
      $obj::HEAD_FLD             => $head,
      $obj::BODY_FLD             => $body,
      $obj::TITLE_FLD            => $title,
      $obj::KEYWORDS_FLD         => $keywords,
      $obj::DESCRIPTION_FLD      => $desc,
      $obj::META_DESCRIPTION_FLD => $description,
   );
   $obj->SetLastViewedID($id);
   HandleAdminData($obj, $post, $tpl_name);
   SetLastViewedID($obj::LAST_VIEWED_ID);
}

$smarty->assign('isInsert', isset($_POST['mode']) && $_POST['mode'] == 'Insert')
       ->assign('head', $head)
       ->assign('body', $body)
       ->assign('desc', $desc)
       ->assign('meta_title', $title)
       ->assign('meta_keywords', $keywords)
       ->assign('meta_description', $description)
       ->assign('item_id', !empty($_GET['item_id']) ? $_GET['item_id'] : null)
       ->assign($tpl_name, $obj->GetAll())
       ->display("admin.$tpl_name.tpl");
