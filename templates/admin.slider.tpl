{extends file='admin.tpl'}
{block name='title' append} - Наша команда{/block}
{block name='links' append}
    
{/block}
{block name='main'}
	<h1>Слайдер</h1>
    {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
    <div class="right_block">
        <label for="choose_item">Выберите проект</label>
        <select id="choose_item">
            <option value="">Слайд 1</option>
        </select>
        <script type="text/javascript">
            
        </script>
        <h2>Редактирование слайда</h2>
        
            <div class="edit">
                <form action="/admin/slider" method="post" class="item_edit" id="item{$project.texts_id}">
                    <input type="hidden" name="id" value="{$project.texts_id}" />
                    <div class="form_block">
                        <label for="head_{$smarty.foreach.f.index}">Заголовок</label>
                        <input id="head_{$smarty.foreach.f.index}" name="head" value="{$project.texts_head}" />
                    </div>
                    <div class="form_block">
                        <label for="body_{$smarty.foreach.f.index}">Описание</label>
                        <textarea id="description_{$smarty.foreach.f.index}" name="body" cols="50" rows="5">{$project.texts_body}</textarea>
                    </div>
                    <div class="buttons"><button name="mode" value="Update">Сохранить</button></div>
                </form>
            </div>
        
        
    </div>
{/block}