{extends file='admin.tpl'}
{block name='title' append} - Услуги{/block}
{block name='links' append}
{/block}
{block name='main'}
	<h1>Услуги</h1>
	<div class="right_block">
		<label for="choose">Выберите услугу</label>
		<select id="choose" id="choose">
			<option value="0">Услуга 1</option>
		</select>
		<h2>Редактирование услуги</h2>
		<div id="edit_0" class="edit">
			<form>
				<div class="form_block">
					<label for="title_0">Заголовок</label>
					<input id="title_0" name="title_0" value="" />
				</div>
				<div class="form_block">
					<label for="description_0">Описание</label>
					<textarea id="description_0" name="description_0" cols="90" rows="10"></textarea>
				</div>
				<div class="buttons"><button id="save_0">Сохранить</button><button id="delete_0" class="red">Удалить</button></div>
			</form>
		</div>
		<div class="add">			
			<h2>Добавление услуги</h2>
			<form>
				<div class="form_block">
					<label for="new_title">Заголовок</label>
					<input id="new_title" name="new_title" value="" />
				</div>
				<div class="form_block">
					<label for="new_description">Описание</label>
					<textarea id="new_description" name="new_description" cols="90" rows="10"></textarea>
				</div>
				<div class="buttons"><button id="add">Добавить</button></div>
			</form>
		</div>
	</div>
{/block}