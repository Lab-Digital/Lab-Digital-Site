{extends file='admin.tpl'}
{block name='title' append} - Проекты{/block}
{block name='links' append}
{/block}
{block name='main'}
	<h1>Проекты</h1>
	<div class="right_block">
		<label for="choose">Выберите проект</label>
		<select id="choose" id="choose">
			<option value="0">Проект 1</option>
		</select>
		<h2>Редактирование проекта</h2>
		<div id="edit_0" class="edit">
			<form><div class="form_block">
					<label for="description_0">Описание</label>
					<textarea id="description_0" name="description_0" cols="90" rows="10"></textarea>
				</div>
				<div class="buttons"><button id="save_0">Сохранить</button></div>
			</form>
		</div>
		<div id="edit_1" class="edit hidden">
			<form>
				<div class="form_block">
					<label for="description_1">Описание</label>
					<textarea id="description_1" name="description_1" cols="90" rows="10"></textarea>
				</div>
				<div class="buttons"><button id="save_1">Сохранить</button></div>
			</form>
		</div>
		<div id="edit_2" class="edit hidden">
			<form>
				<div class="form_block">
					<label for="description_2">Описание</label>
					<textarea id="description_2" name="description_2" cols="90" rows="10"></textarea>
				</div>
				<div class="buttons"><button id="save_2">Сохранить</button></div>
			</form>
		</div>
	</div>
{/block}