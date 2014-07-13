<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/container.php';

switch ($request[0]) {
   case '': case null: case false:
      $smarty->display('index.tpl');
      break;

   case 'news':
      $smarty->display('news.tpl');
      break;

   case 'we':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
      $smarty->assign('about', $_texts->SetSamplingScheme(Texts::ABOUT_SCHEME)->GetById(Texts::ABOUT_TEXT_ID))->display('we.tpl');
      break;

   case 'services':
      $smarty->display('services.tpl');
      break;

   case 'admin':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Admin.php';

      $isLoginPage = empty($request[1]) || $request[1] == 'login';
      if ($_admin->IsAdmin()) {
         if ($isLoginPage) {
            Redirect('/admin/' . ADMIN_START_PAGE);
         }
      } elseif (!$isLoginPage) {
         Redirect('/admin/');
      }
      $request[1] = !empty($request[1]) ? $request[1] : null;
      switch ($request[1]) {
         case '': case 'login': case null: case false:
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.login.php';
            break;

         case 'we':
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.we.php';
            break;

         case 'news':
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.news.php';
            break;

         case 'projects':
         case 'services':
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Service.php';
            $tpl_name = $request[1];
            $obj = $request[1] == 'projects' ? $_texts->SetSamplingScheme(Texts::PROJECTS_SCHEME) : $_service->AddOrder(Service::HEAD_FLD);
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.texts.php';
            break;

         case 'other':
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.other.php';
            break;

         case 'logout':
            unset($_SESSION['admin_login']);
            unset($_SESSION['admin_pass']);
            header('Location: /admin');
            break;

         default:
            header('Location: /admin/' . ADMIN_START_PAGE);
            break;
      }
      break;

   default:
      echo "FAIL ERROR";
      #error page
}
