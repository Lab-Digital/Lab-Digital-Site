{extends file='admin.tpl'}
{block name='title' append} - Проекты{/block}
{block name='links' append}
   <script type="text/javascript" src="/js/select_plugin.js"></script>
   <script src="/upload_photo/js/plugin.js"></script>
   <script>
   {literal}
   $(function(){
      $('div.in button.upload').each(function(){
         var $id = $(this).attr('data-id');
         $(this).getUpload({
            'uploadType'  : 'projects',
            'item_id'     :  $id,
            'width'       : '200',
            'height'      : '200',
            'count'       : '1',
            'afterResize' : '700',
            'sizes'       : 's#200#200'
         });
      });
   });
   {/literal}
   </script>
   <script src="/js/images.js"></script>
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
      <script type="text/javascript">
         $('#choose_item option[value="{$item_id}"]').attr('selected', 'selected');
      </script>
      <h2>Редактирование проекта</h2>
      {foreach from=$projects item=project name=f}
      <div class="edit">
         <form action="/admin/projects" method="post" class="item_edit" id="item{$project.texts_id}">
            <input type="hidden" name="id" value="{$project.texts_id}" />
            <div class="form_block">
               <label for="head_{$smarty.foreach.f.index}">Заголовок</label>
               <input id="head_{$smarty.foreach.f.index}" name="head" value="{$head|default:$project.texts_head}" />
            </div>
            <div class="form_block">
               <label for="title_{$smarty.foreach.f.index}">Meta title</label>
               <input id="title_{$smarty.foreach.f.index}" name="title" value="{$meta_title|default:$project.texts_meta_title}" />
            </div>
            <div class="form_block">
               <label for="body_{$smarty.foreach.f.index}">Описание</label>
               <textarea id="body_{$smarty.foreach.f.index}" name="body" cols="130" rows="15">{$body|default:$project.texts_body}</textarea>
            </div>
            <div class="form_block">
               <label for="description_{$smarty.foreach.f.index}">Meta description</label>
               <textarea id="description_{$smarty.foreach.f.index}" name="description" cols="90" rows="10">{$meta_description|default:$project.texts_meta_description}</textarea>
            </div>
            <div class="form_block">
               <label for="keywords_{$smarty.foreach.f.index}">Meta keywords</label>
               <textarea id="keywords_{$smarty.foreach.f.index}" name="keywords" cols="90" rows="10">{$meta_keywords|default:$project.texts_meta_keywords}</textarea>
            </div>
            <div class="buttons"><button name="mode" value="Update">Сохранить</button></div>
         </form>
         <div class="in">
            <h1 class="head_upload">Фото</h1>
            <button class="upload" type="submit" data-id="{$project.texts_id}">Загрузить фото</button>
            <ul>
            {if !empty($project.texts_photo_id)}
               <li><a href="/scripts/uploads/{$project.texts_photo_id}_b.jpg"><img src="/scripts/uploads/{$project.texts_photo_id}_s.jpg" /></a><button class="x" data="{$project.texts_photo_id}">x</button></li>
            {/if}
            </ul>
         </div>
      </div>
      {/foreach}
      {include file='admin.set_select.tpl'}
   </div>
{/block}