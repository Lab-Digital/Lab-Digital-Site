<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Service.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

SetLastViewedID(Service::LAST_VIEWED_ID);

if (isset($_POST['mode'])) {
   $post = GetPOST();
   $id = isset($post['id']) ? $post['id'] : '';
   $body = $post['mode'] == 'Insert' && isset($post['body']) ? $post['body'] : '';
   $post['params'] = Array(Service::ID_FLD => $id, Service::HEAD_FLD => $post['head'], Service::BODY_FLD => $post['body']);
   $_service->SetLastViewedID($id);
   HandleAdminData($_service, $post, 'services');
   SetLastViewedID(Service::LAST_VIEWED_ID);
}

$smarty->assign('body', isset($body) ? $body : '')
       ->assign('services', $_service->AddOrder(Service::HEAD_FLD)->GetAll())
       ->display('admin.services.tpl');
