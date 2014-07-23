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
            'uploadType'  : 'services',
            'item_id'     :  $data,
            'width'       : '100',
            'height'      : '100',
            'count'       : '1',
            'afterResize' : '1024',
            'sizes'       : 's#100#100'
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
                  <input id="head_{$smarty.foreach.f.index}" name="head" value="{$head|default:$service.service_head}" />
               </div>
               <div class="form_block">
                  <label for="title_{$smarty.foreach.f.index}">Meta title</label>
                  <input id="title_{$smarty.foreach.f.index}" name="title" value="{$meta_title|default:$service.service_meta_title}" />
               </div>
                <div class="form_block">
                  <label for="description_{$smarty.foreach.f.index}">Описание</label>
                  <textarea class="article_body" name="desc" id="description_{$smarty.foreach.f.index}" rows="2" cols="100">{$desc|default:$service.service_description}</textarea>
                </div>
               <div>
                  <label for="body_{$smarty.foreach.f.index}">Текст</label>
                  <textarea id="body_{$smarty.foreach.f.index}" name="body" cols="130" rows="15">{$body|default:$service.service_body}</textarea>
               </div>
               <div class="form_block">
                  <label for="meta_description_{$smarty.foreach.f.index}">Meta description</label>
                  <textarea id="meta_description_{$smarty.foreach.f.index}" name="description" cols="90" rows="10">{$meta_description|default:$service.service_meta_description}</textarea>
               </div>
               <div class="form_block">
                  <label for="keywords_{$smarty.foreach.f.index}">Meta keywords</label>
                  <textarea id="keywords_{$smarty.foreach.f.index}" name="keywords" cols="90" rows="10">{$meta_keywords|default:$service.service_meta_keywords}</textarea>
               </div>
               <div class="buttons"><button name="mode" value="Update">Сохранить</button><button class="red" name="mode" value="Delete">Удалить</button></div>
            </form>
            <div class="in">
               <button class="upload" type="submit" data="{$service.service_id}">Загрузить фото</button>
               <ul>
                  {if !empty($service.service_photo_id)}
                     <li><a href="/scripts/uploads/{$service.service_photo_id}_b.jpg" class="gallery"><img src="/scripts/uploads/{$service.service_photo_id}_s.jpg" /></a><button class="x" data="{$service.service_photo_id}">x</button></li>
                  {/if}
               </ul>
            </div>
         </div>
         {/foreach}
         {include file='admin.set_select.tpl'}
      {/if}
      {if !$isInsert}
         {assign var='head' value=''}
         {assign var='desc' value=''}
         {assign var='body' value=''}
         {assign var='meta_title' value=''}
         {assign var='meta_keywords' value=''}
         {assign var='meta_description' value=''}
      {/if}
      <h2>Добавление услуги</h2>
      <div class="add">
         <form action="/admin/services" method="post">
            <div class="form_block">
               <label for="new_title">Заголовок</label>
               <input id="new_title" name="head" value="{$head}" />
            </div>
            <div class="form_block">
               <label for="title">Meta title</label>
               <input id="title" name="title" value="{$meta_title}" />
            </div>
            <div class="form_block">
               <label for="article_description_new">Описание</label>
               <textarea class="article_body" name="desc" id="article_description_new" rows="2" cols="100">{$desc}</textarea>
             </div>
            <div class="form_block">
               <label for="new_body">Текст</label>
               <textarea id="new_body" name="body" cols="130" rows="15">{$body}</textarea>
            </div>
            <div class="form_block">
               <label for="description">Meta description</label>
               <textarea id="description" name="description" cols="90" rows="10">{$meta_description}</textarea>
            </div>
            <div class="form_block">
               <label for="keywords">Meta keywords</label>
               <textarea id="keywords" name="keywords" cols="90" rows="10">{$meta_keywords}</textarea>
            </div>
            <div class="buttons"><button id="add" name="mode" value="Insert">Добавить</button></div>
         </form>
      </div>
   </div>
{/block}