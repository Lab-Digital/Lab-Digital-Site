<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.IndexMeta.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

$title = $keywords = $description = null;

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $title       = isset($post['title'])       ? $post['title']       : null;
   $keywords    = isset($post['keywords'])    ? $post['keywords']    : null;
   $description = isset($post['description']) ? $post['description'] : null;
   $post['params'] = Array(
      IndexMeta::ID_FLD          => IndexMeta::META_ID,
      IndexMeta::TITLE_FLD       => $title,
      IndexMeta::KEYWORDS_FLD    => $keywords,
      IndexMeta::DESCRIPTION_FLD => $description
   );
   HandleAdminData($_indexMeta, $post, 'other');
}

$smarty->assign('meta_title', $title)
       ->assign('meta_keywords', $keywords)
       ->assign('meta_description', $description)
       ->assign('meta', $_indexMeta->GetById(IndexMeta::META_ID))
       ->display('admin.other.tpl');
