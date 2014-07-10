<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $_texts->SetFieldByName(Texts::ID_FLD, Texts::ABOUT_TEXT_ID)->SetFieldByName(Texts::BODY_FLD, $post['description'])->Update();
   Redirect('/admin/we');
}

$smarty->assign('about', $_texts->GetById(Texts::ABOUT_TEXT_ID))->display('admin.we.tpl');
