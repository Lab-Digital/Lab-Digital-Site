{extends file='admin.tpl'}
{block name='title' append} - Услуги{/block}
{block name='links' append}
   <script type="text/javascript" src="/js/select_plugin.js"></script>
{/block}
{block name='main'}
   <h1>Услуги</h1>
   {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
   {if $services|@count}
      <label for="choose">Выберите услугу</label>
      <select id="choose_item">
      {foreach from=$services item=service}
         <option value="{$service.service_id}">{$service.service_head}</option>
      {/foreach}
      </select>
      <h2>Редактирование услуги</h2>
      {foreach from=$services item=service name=f}
         <form action="/admin/services" method="post" class="item_edit" id="item{$service.service_id}">
            <div class="form_block">
               <input type="hidden" name="id" value="{$service.service_id}" />
               <label for="head_{$smarty.foreach.f.index}">Заголовок</label>
               <input id="head_{$smarty.foreach.f.index}" name="head" value="{$service.service_head}" />
               <label for="body_{$smarty.foreach.f.index}">Описание</label>
               <textarea id="description_{$smarty.foreach.f.index}" name="body" cols="130" rows="15">{$service.service_body}</textarea>
            </div>
            <div class="buttons"><button name="mode" value="Update">Сохранить</button><button class="red" name="mode" value="Delete">Удалить</button></div>
         </form>
      {/foreach}
      {include file='admin.set_select.tpl'}
   {/if}
   <div class="add">
      <h2>Добавление услуги</h2>
      <form action="/admin/services" method="post">
         <div class="form_block">
            <label for="new_title">Заголовок</label>
            <input id="new_title" name="head" value="" />
         </div>
         <div class="form_block">
            <label for="new_body">Описание</label>
            <textarea id="new_body" name="body" cols="130" rows="15">{$body}</textarea>
         </div>
         <div class="buttons"><button id="add" name="mode" value="Insert">Добавить</button></div>
      </form>
   </div>
{/block}