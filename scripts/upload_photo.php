<?php
if (empty($_SERVER['HTTP_REFERER'])) Redirect();

$referer = $_SERVER['HTTP_REFERER'];

$smarty->assign('referer', $referer)
       ->assign('photo_data', $_POST['data'])
       ->display('upload_photo.tpl');