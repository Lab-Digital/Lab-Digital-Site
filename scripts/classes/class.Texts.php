<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/scripts/classes/class.Entity.php';

class Texts extends Entity
{
   const ABOUT_TEXT_ID = 1;

   const NAME_FLD = 'name';
   const HEAD_FLD = 'head';
   const BODY_FLD = 'body';

   const TABLE = 'texts';

   const ABOUT_SCHEME = 2;
   const PROJECTS_SCHEME = 3;

   const LAST_VIEWED_ID = 'last_viewed_projects_id';

   public function __construct()
   {
      parent::__construct();
      $this->fields = Array(
         $this->idField,
         new Field(
            static::NAME_FLD,
            StrType(100),
            false
         ),
         new Field(
            static::HEAD_FLD,
            StrType(150),
            true,
            'Название проекта',
            Array(Validate::IS_NOT_EMPTY)
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

         case static::ABOUT_SCHEME:
            $this->fields = [$this->GetFieldByName(static::BODY_FLD)];
            break;
      }
      $this->selectFields = SQL::GetListFieldsForSelect(SQL::PrepareFieldsForSelect(static::TABLE, $this->fields));
   }

}

$_texts = new Texts();
