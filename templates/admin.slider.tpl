{extends file='admin.tpl'}
{block name='title' append} - Наша команда{/block}
{block name='links' append}
  <script type="text/javascript" src="/js/select_plugin.js"></script>
{/block}
{block name='main'}
  <h1>Слайдер</h1>
  {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
  <div class="right_block">
    <label for="choose_item">Выберите проект</label>
    <select id="choose_item">
    {foreach from=$sliders item=slider name=f}
      <option value="{$slider.slider_id}">Слайд {$smarty.foreach.f.iteration}</option>
    {/foreach}
    </select>
    <h2>Редактирование слайда</h2>
    {foreach from=$sliders item=slider name=f}
    <div class="edit">
      <form action="/admin/slider" method="post" class="item_edit" id="item{$slider.slider_id}">
        <input type="hidden" name="id" value="{$slider.slider_id}" />
        <div class="form_block">
          <label for="head_{$smarty.foreach.f.index}">Заголовок</label>
          <input id="head_{$smarty.foreach.f.index}" name="head" value="{$head|default:$slider.slider_head}" />
        </div>
        <div class="form_block">
          <label for="body_{$smarty.foreach.f.index}">Описание</label>
          <textarea id="description_{$smarty.foreach.f.index}" name="body" cols="50" rows="5">{$body|default:$slider.slider_body}</textarea>
        </div>
        <div class="buttons"><button name="mode" value="Update">Сохранить</button></div>
      </form>
    </div>
    {/foreach}
  </div>
  {include file='admin.set_select.tpl'}
{/block}