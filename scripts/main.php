<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Service.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.News.php';

$smarty->assign('services', $_service->SetSamplingScheme(Service::MAIN_SCHEME)->GetAll())
       ->assign('articles', $_news->GetNews())
       ->assign('projects', $_texts->SetSamplingScheme(Texts::MAIN_PROJECTS_SCHEME)->GetAll())
       ->display('index.tpl');
