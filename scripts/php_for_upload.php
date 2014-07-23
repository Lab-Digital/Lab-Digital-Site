<?php
//$_POST['__file']
try {
  require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/utils.php';
  require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.TableImages.php';
  $ajaxOtherResult = Array('result' => true, 'message' => 'Загрузка прошла успешно!');
  $post = GetPOST();
  $item_id = $post['item_id'];
  switch ($post['uploadType']) {
    case 'we':
    case 'projects':
    case 'services':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Service.php';
      $obj = $post['uploadType'] == 'services' ? $_service : $_texts;
      if (!empty($post['image_id'])) {
         $_image->Delete($post['image_id']);
      }
      try {
         $db->link->beginTransaction();
         $_POST['__file'] = $_image->Insert(true);
         $obj->SetFieldByName($obj::ID_FLD, $item_id)->SetFieldByName($obj::PHOTO_FLD, $_POST['__file'])->Update();
         $db->link->commit();
      } catch (DBException $e) {
         $db->link->rollback();
         throw new Exception($e->getMessage());
      }
      break;

    case 'news':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.News.php';
      if (empty($post['isAvatar']) || !$post['isAvatar']) {
         $_POST['__file'] = $_newsImages->SetFieldByName(NewsImages::NEWS_FLD, $item_id)->Insert(true);
      } else {
         try {
            $db->link->beginTransaction();
            $_POST['__file'] = $_image->Insert(true);
            $_news->SetFieldByName(News::ID_FLD, $item_id)->SetFieldByName(News::PHOTO_FLD, $_POST['__file'])->Update();
            $db->link->commit();
         } catch (DBException $e) {
            $db->link->rollback();
            throw new Exception($e->getMessage());
         }
      }
      break;

    default:
      $ajaxOtherResult['result'] = false;
      $ajaxOtherResult['message'] = 'Неопознаный тип загрузки!';
      break;
  }
} catch (DBException $e) {
  $ajaxOtherResult['result'] = false;
  $ajaxOtherResult['message'] = 'Ошибка, связанная с базой данных!';
}