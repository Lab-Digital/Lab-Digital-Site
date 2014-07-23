{extends file='admin.tpl'}
{block name='title' append} - Услуги{/block}
{block name='links' append}
   <script type="text/javascript" src="/js/select_plugin.js"></script>
   <script src="/upload_photo/js/plugin.js"></script>
   <script>
   {literal}
   $(function(){
      $('div.in button.upload').each(function(){
         $data = $(this).attr('data');
         $(this).getUpload({
            'uploadType'  : 'service', 
            'item_id'     :  $data, 
            'width'       : '200', 
            'height'      : '240',
            'count'       : '1',
            'sizes'       : 's#200#240'
         });
      });
   });
   {/literal}
   </script>
   <script src="/js/images.js"></script>
{/block}
{block name='main'}
   <h1>Услуги</h1>
   {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
   <div class="right_block">
      {if $services|@count}
         <label for="choose">Выберите услугу</label>
         <select id="choose_item">
            {foreach from=$services item=service}
               <option value="{$service.service_id}">{$service.service_head}</option>
            {/foreach}
         </select>
         <script type="text/javascript">
            $('#choose_item option[value="{$item_id}"]').attr('selected', 'selected');
         </script>
         <h2>Редактирование услуги</h2>
         {foreach from=$services item=service name=f}
         <div class="edit">
            <form action="/admin/services" method="post" class="item_edit" id="item{$service.service_id}">
               <input type="hidden" name="id" value="{$service.service_id}" />
               <div class="form_block">
                  <label for="head_{$smarty.foreach.f.index}">Заголовок</label>
                  <input id="head_{$smarty.foreach.f.index}" name="head" value="{$service.service_head}" />
               </div>
               <div>
                  <label for="body_{$smarty.foreach.f.index}">Описание</label>
                  <textarea id="description_{$smarty.foreach.f.index}" name="body" cols="130" rows="15">{$service.service_body}</textarea>
               </div>
               <div class="buttons"><button name="mode" value="Update">Сохранить</button><button class="red" name="mode" value="Delete">Удалить</button></div>
            </form>
            <div class="in">
               <button class="upload" type="submit" data="{$service.service_id}">Загрузить фото</button>
               <ul>
                  {if isset($service.service_photo_id)}
                     <li><a href="/scripts/uploads/{$service.service_photo_id}_b.jpg" class="gallery"><img src="/scripts/uploads/{$service.service_photo_id}_s.jpg" /></a><button class="x" data="{$service.service_photo_id}">x</button></li>
                  {/if}
               </ul>
            </div>
         </div>
         {/foreach}
         {include file='admin.set_select.tpl'}
      {/if}
      <h2>Добавление услуги</h2>
      <div class="add">
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
   </div>
{/block}