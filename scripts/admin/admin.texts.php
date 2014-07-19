<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

SetLastViewedID($obj::LAST_VIEWED_ID);

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $id = isset($post['id']) ? $post['id'] : '';
   $body = $post['mode'] == 'Insert' && isset($post['body']) ? $post['body'] : '';
   $post['params'] = Array($obj::ID_FLD => $id, $obj::HEAD_FLD => $post['head'], $obj::BODY_FLD => $post['body']);
   $obj->SetLastViewedID($id);
   HandleAdminData($obj, $post, $tpl_name);
   SetLastViewedID($obj::LAST_VIEWED_ID);
}

$smarty->assign('body', isset($body) ? $body : '')
       ->assign($tpl_name, $obj->GetAll())
       ->assign('item_id', !empty($_GET['item_id']) ? $_GET['item_id'] : null)
       ->display("admin.$tpl_name.tpl");
