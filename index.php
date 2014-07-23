<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/container.php';

switch ($request[0]) {
   case '': case null: case false:
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/main.php';
      break;

   case 'news':
      if (empty($request[1])) Redirect('/#news');
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.News.php';
      $data = $_news->SetSamplingScheme(News::INFO_SCHEME)->GetById($request[1]);
      if (empty($data)) Redirect('/#news');
      $smarty->assign('article', $data)->display('news.tpl');
      break;

   case 'services':
      if (empty($request[1])) Redirect('/#services');
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Service.php';
      $data = $_service->GetById($request[1]);
      if (empty($data)) Redirect('/#services');
      $smarty->assign('service', $data)->display('services.tpl');
      break;

   case 'projects':
      if (empty($request[1])) Redirect('/#projects');
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
      $data = $_texts->GetProjectById($request[1]);
      if (empty($data)) Redirect('/#projects');
      $smarty->assign('project', $data)->display('projects.tpl');
      break;

   case 'uploadphoto':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/upload_photo.php';
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

         case 'slider':
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.slider.php';
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

         case 'change_data':
            require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/admin/admin.change_data.php';
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
