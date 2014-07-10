{extends file='admin.tpl'}
{block name='title' append} - Проекты{/block}
{block name='links' append}
   <script type="text/javascript" src="/js/select_plugin.js"></script>
{/block}
{block name='main'}
   <h1>Проекты</h1>
   {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
   <div class="right_block">
      <label for="choose_item">Выберите проект</label>
      <select id="choose_item">
      {foreach from=$projects item=project name=f}
         <option value="{$project.texts_id}">Проект {$smarty.foreach.f.index}</option>
      {/foreach}
      </select>
      <h2>Редактирование проекта</h2>
      {foreach from=$projects item=project name=f}
         <form action="/admin/projects" method="post" class="item_edit" id="item{$project.texts_id}">
            <div class="form_block">
               <input type="hidden" name="id" value="{$project.texts_id}" />
               <label for="head_{$smarty.foreach.f.index}">Заголовок</label>
               <input id="head_{$smarty.foreach.f.index}" name="head" value="{$project.texts_head}" />
               <label for="body_{$smarty.foreach.f.index}">Описание</label>
               <textarea id="description_{$smarty.foreach.f.index}" name="body" cols="130" rows="15">{$project.texts_body}</textarea>
            </div>
            <div class="buttons"><button name="mode" value="Update">Сохранить</button></div>
         </form>
      {/foreach}
      {include file='admin.set_select.tpl'}
   </div>
{/block}