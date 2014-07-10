{extends file='admin.tpl'}
{block name='title' append} - Остальное{/block}
{block name='links' append}
{/block}
{block name='main'}
	<h1>Остальное</h1>
	<h2>Мета-данные</h2>
	<label for="choose">Выберите новость</label>
	<select id="choose" id="choose">
		<option value="0">Мета 1</option>
		<option value="1">Мета 2</option>
		<option value="2">Мета 3</option>
	</select>
	{for $i=1 to 3}
		<form {if $i != 1}class="hidden"{/if}>
			<div class="form_block">
				<label for="meta_title_{$i}">Meta title</label>
				<input id="meta_title_{$i}" name="meta_title_{$i}" value="Бла бла бла" />
			</div>
			<div class="form_block">
				<label for="meta_description_{$i}">Meta description</label>
				<textarea id="meta_description_{$i}" name="meta_description_{$i}" cols="90" rows="10">Бла бла бла</textarea>
			</div>
			<div class="form_block">
				<label for="meta_keywords_{$i}">Meta keywords</label>
				<textarea id="meta_keywords_{$i}" name="meta_keywords_{$i}" cols="90" rows="10">first, second, third</textarea>
			</div>
			<div class="buttons"><button id="save_{$i}">Сохранить</button></div>
		</form>
	{/for}
{/block}