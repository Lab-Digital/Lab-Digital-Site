{extends file='admin.tpl'}
{block name='title' append} - Наша команда{/block}
{block name='links' append}
   <script src="/upload_photo/js/plugin.js"></script>
   <script>
   {literal}
   $(function(){
    $('div.in button.upload').getUpload({
         'uploadType'  : 'we', 
         'item_id'     : '1', 
         'width'       : '300', 
         'height'      : '200',
         'count'       : '1',
         'sizes'       : 's#300#200'
    });
   });
   {/literal}
   </script>
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
      <button class="upload" type="submit" data="1">Загрузить фото</button>
    </div>
	</form>
{/block}