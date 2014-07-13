{extends file='admin.tpl'}
{block name='title' append} - Новости{/block}
{block name='links' append}
   <script type="text/javascript" src="/js/select_plugin.js"></script>
{/block}
{block name='main'}
   <h1>Новости</h1>
   {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
   <aside class="menu">{$article_menu}</aside>
   <div class="right_block">
    {if $article_level==2}
      {if $articles|@count!=0}
        <label for="choose_item">Выберите новость</label>
        <select id="choose_item" name="choose_item">
        {foreach from=$articles item=article}
          <option value="{$article.news_id}">{$article.news_head}</option>
        {/foreach}
        </select>
      {/if}
      <h2>Редактирование новости</h2>
      {foreach from=$articles item=article name=f}
      <div class="edit">
        <form action="/admin/news/{$year}/{$month}" method="post" class="item_edit" id="item{$article.news_id}">
          <input type="hidden" class="article_id" name="id" value="{$article.news_id}" />
          <div class="form_block">
            <label for="article_head_{$smarty.foreach.f.index}">Заголовок</label>
            <input class="article_head" name="head" id="article_head_{$smarty.foreach.f.index}" value="{$article.news_head}" />
          </div>
          <div class="form_block">
            <label for="article_date_{$smarty.foreach.f.index}">Дата</label>
            <input class="article_date date_pick" name="date" id="article_date_{$smarty.foreach.f.index}" value="{$article.news_publication_date}" />
          </div>
          <div class="form_block">
            <label for="article_body_{$smarty.foreach.f.index}">Текст</label>
            <textarea class="article_body" name="body" id="article_body_{$smarty.foreach.f.index}" rows="12" cols="100">{$article.news_body}</textarea>
          </div>
          <div class="buttons"><button class="save" name="mode" value="Update">Сохранить</button><button class="delete red" name="mode" value="Delete">Удалить</button></div>
        </form>
      </div>
      {/foreach}
    {/if}
    {include file='admin.set_select.tpl'}
    <h2>Добавить новость</h2>
    <div class="add">
      <form action="/admin/news{if isset($year)}/{$year}/{$month}{/if}" method="post" id="add_article">
        <div class="form_block">
          <label for="article_head_new">Заголовок</label>
          <input class="article_head" name="head" id="article_head_new" value="{$head}" />
        </div>
        <div class="form_block">
          <label for="article_date_new">Дата</label>
          <input class="article_date date_pick" name="date" id="article_date_new" value="{$date}" />
        </div>
        <div class="form_block">
          <label for="article_body_new">Текст</label>
          <textarea class="article_body" name="body" id="article_body_new" rows="12" cols="100">{$body}</textarea>
        </div>
        <div class="buttons"><button class="save" name="mode" value="Insert">Добавить</button></div>
      </form>
    </div>
  </div>
{/block}