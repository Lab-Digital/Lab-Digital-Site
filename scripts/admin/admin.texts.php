<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

SetLastViewedID($obj::LAST_VIEWED_ID);

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $id          = isset($post['id']) ? $post['id'] : '';
   $head        = $post['mode'] == 'Insert' && isset($post['head'])        ? $post['head']        : '';
   $body        = $post['mode'] == 'Insert' && isset($post['body'])        ? $post['body']        : '';
   $title       = $post['mode'] == 'Insert' && isset($post['title'])       ? $post['title']       : '';
   $keywords    = $post['mode'] == 'Insert' && isset($post['keywords'])    ? $post['keywords']    : '';
   $description = $post['mode'] == 'Insert' && isset($post['description']) ? $post['description'] : '';
   $post['params'] = Array(
      $obj::ID_FLD          => $id,
      $obj::HEAD_FLD        => $post['head'],
      $obj::BODY_FLD        => $post['body'],
      $obj::TITLE_FLD       => $post['title'],
      $obj::KEYWORDS_FLD    => $post['keywords'],
      $obj::DESCRIPTION_FLD => $post['description']
   );
   $obj->SetLastViewedID($id);
   HandleAdminData($obj, $post, $tpl_name);
   SetLastViewedID($obj::LAST_VIEWED_ID);
}

$smarty->assign('head', isset($head) ? $head : '')
       ->assign('body', isset($body) ? $body : '')
       ->assign($tpl_name, $obj->GetAll())
       ->assign('meta_title', isset($title) ? $title : '')
       ->assign('meta_keywords', isset($keywords) ? $keywords : '')
       ->assign('meta_description', isset($description) ? $description : '')
       ->assign('item_id', !empty($_GET['item_id']) ? $_GET['item_id'] : null)
       ->display("admin.$tpl_name.tpl");
