<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/utils.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Proposal.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/handlers/handler.php';

class ProposalHandler extends Handler
{
   public function __construct()
   {
      $this->entity = new Proposal();
   }

   public function Insert($params, $getLastInsertId = true)
   {
      $this->entity->ValidateEmail(!empty($params['email']) ? $params['email'] : null)
                   ->ValidatePhone(!empty($params['phone']) ? $params['phone'] : null);
      try {
         $this->entity->SetFields($params);
         return $getLastInsertId ? $this->entity->Insert(true) : $this->entity->Insert(false);
      } catch (DBException $e) {
         throw new Exception('Возникли проблемы при добавлении заявки.');
      }
   }
}

try {
   $handler = (new ProposalHandler())->Handle(GetPOST());
} catch (Exception $e) {
   $ajaxResult['result'] = false;
   $ajaxResult['message'] = $e->getMessage();
}

echo json_encode($ajaxResult);
