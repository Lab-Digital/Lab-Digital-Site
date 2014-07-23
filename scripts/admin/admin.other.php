<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.IndexMeta.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $post['params'] = Array(
      IndexMeta::ID_FLD          => IndexMeta::META_ID,
      IndexMeta::TITLE_FLD       => $post['title'],
      IndexMeta::KEYWORDS_FLD    => $post['keywords'],
      IndexMeta::DESCRIPTION_FLD => $post['description']
   );
   HandleAdminData($_indexMeta, $post, 'other');
}

$smarty->assign('meta', $_indexMeta->GetById(IndexMeta::META_ID))->display('admin.other.tpl');
