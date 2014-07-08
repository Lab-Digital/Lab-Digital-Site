{extends file='admin.tpl'}
{block name='title' append} - Наша команда{/block}
{block name='links' append}
{/block}
{block name='main'}
	<h1>Наша команда</h1>
	<form>
		<div class="form_block">
			<label for="description">Описание</label>
			<textarea id="description" name="description" cols="90" rows="10">Бла бла бла</textarea>
		</div>
		<div class="buttons"><button id="save">Сохранить</button></div>
	</form>
{/block}