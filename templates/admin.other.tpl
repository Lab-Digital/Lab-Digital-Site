{extends file='admin.tpl'}
{block name='title' append} - Остальное{/block}
{block name='links' append}
{/block}
{block name='main'}
	<h1>Остальное</h1>
	<h2>Мета-данные</h2>
	<form>
		<div class="form_block">
			<label for="meta_title">Meta title</label>
			<input id="meta_title" name="meta_title" value="Бла бла бла" />
		</div>
		<div class="form_block">
			<label for="meta_description">Meta description</label>
			<textarea id="meta_description" name="meta_description" cols="90" rows="10">Бла бла бла</textarea>
		</div>
		<div class="form_block">
			<label for="meta_keywords">Meta keywords</label>
			<textarea id="meta_keywords" name="meta_keywords" cols="90" rows="10">first, second, third</textarea>
		</div>
		<div class="buttons"><button id="save">Сохранить</button></div>
	</form>
{/block}