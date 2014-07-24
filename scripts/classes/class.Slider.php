<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Entity.php';

class Slider extends Entity
{

   const HEAD_FLD = 'head';
   const BODY_FLD = 'body';

   const TABLE = 'slider';

   const LAST_VIEWED_ID = 'last_viewed_slider_id';

   public function __construct()
   {
      parent::__construct();
      $this->fields = Array(
         $this->idField,
         new Field(
            static::HEAD_FLD,
            StrType(120),
            true,
            'Заголовок слайдера',
            Array(Validate::IS_NOT_EMPTY)
         ),
         new Field(
            static::BODY_FLD,
            StrType(120, 'Описание слайдера слишком длинное'),
            true,
            'Описание слайдера'
         )
      );
      $this->orderFields = [static::ID_FLD => new OrderField(static::TABLE, $this->idField)];
   }

   public function SetSelectValues()
   {
      $this->AddOrder(static::ID_FLD);
      parent::SetSelectValues();
   }
}

$_slider = new Slider();
