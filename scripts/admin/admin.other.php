<?php

$smarty->assign('admin', $_admin->GetById(ADMIN_ID))
       ->display('admin.other.tpl');
