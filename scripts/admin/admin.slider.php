<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Slider.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

SetLastViewedID(Slider::LAST_VIEWED_ID);

$head = $body = null;

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $id   = $post['id'];
   $head = $post['head'];
   $body = $post['body'];
   $post['params'] = [Slider::ID_FLD => $id, Slider::HEAD_FLD => $head, Slider::BODY_FLD => $body];
   $_slider->SetLastViewedID($id);
   HandleAdminData($_slider, $post, 'slider');
   SetLastViewedID(Slider::LAST_VIEWED_ID);
}

$smarty->assign('head', $head)
       ->assign('body', $body)
       ->assign('sliders', $_slider->GetAll())
       ->display('admin.slider.tpl');
