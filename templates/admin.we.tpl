{extends file='admin.tpl'}
{block name='title' append} - Наша команда{/block}
{block name='links' append}
{/block}
{block name='main'}
	<h1>Наша команда</h1>
	<form action="/admin/we" method="post">
		<div class="form_block">
			<label for="description">Описание</label>
			<textarea id="description" name="description" cols="90" rows="10">{$about.texts_body}</textarea>
		</div>
		<div class="buttons"><button id="save" name="mode" value="Update">Сохранить</button></div>
	</form>
{/block}