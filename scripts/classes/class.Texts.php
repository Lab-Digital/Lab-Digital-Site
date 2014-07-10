<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Entity.php';

class Texts extends Entity
{
   const ABOUT_TEXT_ID = 1;

   const NAME_FLD = 'name';
   const BODY_FLD = 'body';

   const TABLE = 'texts';

   const PROJECTS_SCHEME = 2;

   const LAST_VIEWED_ID = 'last_viewed_projects_id';

   public function __construct()
   {
      parent::__construct();
      $this->fields = Array(
         $this->idField,
         new Field(
            static::NAME_FLD,
            StrType(150),
            false
         ),
         new Field(
            static::BODY_FLD,
            TextType(),
            true
         )
      );
   }

   public function SetSelectValues()
   {
      switch ($this->samplingScheme) {
         case static::PROJECTS_SCHEME:
            $this->search->AddClause(
               CCond(
                  CF(static::TABLE, $this->GetFieldByName(static::ID_FLD)),
                  CVP(static::ABOUT_TEXT_ID),
                  '',
                  opGT
               )
            );
            break;
      }
      $this->selectFields = SQL::GetListFieldsForSelect(SQL::PrepareFieldsForSelect(static::TABLE, $this->fields));
   }
}

$_texts = new Texts();
