<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Entity.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Image.php';

class Service extends Entity
{
   const HEAD_FLD  = 'head';
   const BODY_FLD  = 'body';
   const PHOTO_FLD = 'photo_id';

   const TABLE = 'service';

   const MAIN_SCHEME = 2;

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
         ),
         new Field(
            static::PHOTO_FLD,
            IntType(),
            true
         )
      );
      $this->orderFields = Array(static::HEAD_FLD => new OrderField(static::TABLE, $this->GetFieldByName(static::HEAD_FLD)));
   }

   public function SetSelectValues()
   {
      $fields = $this->fields;
      switch ($this->samplingScheme) {
         case static::MAIN_SCHEME:
            $fields = [$this->idField, $this->GetFieldByName(static::HEAD_FLD)];
            $this->AddOrder(Service::HEAD_FLD);
            break;
      }
      $this->selectFields = SQL::GetListFieldsForSelect(
         array_merge(
            SQL::PrepareFieldsForSelect(static::TABLE, $fields),
            [ImageWithFlagSelectSQL(static::TABLE, $this->GetFieldByName(static::PHOTO_FLD))]
         )
      );
   }

}

$_service = new Service();
