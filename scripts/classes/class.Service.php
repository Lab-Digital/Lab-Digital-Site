<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Entity.php';

class Service extends Entity
{
   const HEAD_FLD = 'head';
   const BODY_FLD = 'body';

   const TABLE = 'service';

   const LAST_VIEWED_ID = 'last_viewed_services_id';

   public function __construct()
   {
      parent::__construct();
      $this->fields = Array(
         $this->idField,
         new Field(
            static::HEAD_FLD,
            StrType(150),
            true,
            'Название услуги',
            Array(Validate::IS_NOT_EMPTY)
         ),
         new Field(
            static::BODY_FLD,
            TextType(),
            true
         )
      );
      $this->orderFields = Array(static::HEAD_FLD => new OrderField(static::TABLE, $this->GetFieldByName(static::HEAD_FLD)));
   }
}

$_service = new Service();
