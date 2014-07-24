<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Texts.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Slider.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Service.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.News.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.IndexMeta.php';

$smarty->assign('articles', $_news->GetNews())
       ->assign('sliders',  $_slider->GetAll())
       ->assign('meta',     $_indexMeta->GetById(IndexMeta::META_ID))
       ->assign('services', $_service->SetSamplingScheme(Service::MAIN_SCHEME)->GetAll())
       ->assign('projects', $_texts->SetSamplingScheme(Texts::MAIN_PROJECTS_SCHEME)->GetAll())
       ->assign('about',    $_texts->SetSamplingScheme(Texts::ABOUT_SCHEME)->GetById(Texts::ABOUT_TEXT_ID))
       ->display('index.tpl');
