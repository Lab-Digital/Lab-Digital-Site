<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

SetLastViewedID(Texts::LAST_VIEWED_ID);

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $post['params'] = Array(Texts::ID_FLD => $post['id'], Texts::HEAD_FLD => $post['head'], Texts::BODY_FLD => $post['body']);
   $_texts->SetLastViewedID($post['id']);
   HandleAdminData($_texts, $post, 'projects');
   SetLastViewedID(Texts::LAST_VIEWED_ID);
}

$smarty->assign('projects', $_texts->SetSamplingScheme(Texts::PROJECTS_SCHEME)->GetAll())
       ->display('admin.projects.tpl');
