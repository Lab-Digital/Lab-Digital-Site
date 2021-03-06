{extends file='admin.tpl'}
{block name='title' append} - Наша команда{/block}
{block name='links' append}
   <link rel="stylesheet" href="/css/styles_for_text.css" />
   <script src="/js/nicEdit.js"></script>
   <script> 
      {literal}
      $(function(){
         new nicEditor({buttonList : ['underline','subscript','superscript','link','unlink']}).panelInstance('description');
      }); 
      {/literal}
   </script>
   <script src="/upload_photo/js/plugin.js"></script>
   <script>
   {literal}
   $(function(){
    $('div.in button.upload').getUpload({
         'uploadType'  : 'we', 
         'item_id'     : '1', 
         'width'       : '80', 
         'height'      : '80',
         'count'       : '1',
         'sizes'       : 's#80#80'
    });
   });
   {/literal}
   </script>
   <script src="/js/images.js"></script>
{/block}
{block name='main'}
  <h1>Наша команда</h1>
  <form action="/admin/we" method="post">
    <div class="form_block">
      <label for="description">Описание</label>
      <textarea id="description" name="description" cols="90" rows="10">{$about.texts_body}</textarea>
    </div>
    <div class="buttons"><button id="save" name="mode" value="Update">Сохранить</button></div>
    <div class="in">
      <h1 class="head_upload">Фото</h1>
      <button class="upload" type="submit" data="1">Загрузить фото</button>
      {if !empty($about.texts_photo_id)}
        <ul>
          <li><a href="/scripts/uploads/{$about.texts_photo_id}_b.jpg"><img src="/scripts/uploads/{$about.texts_photo_id}_s.jpg" /></a><button class="x" data="{$about.texts_photo_id}">x</button></li>
        </ul>
      {/if}
    </div>
  </form>
{/block}