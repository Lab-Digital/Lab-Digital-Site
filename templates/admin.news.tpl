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
      {foreach from=$articles item=article name=f}
      <form action="/admin/news/{$year}/{$month}" method="post" class="item_edit" id="item{$article.news_id}">
        <input type="hidden" class="article_id" name="id" value="{$article.news_id}" />
        <label for="article_head_{$smarty.foreach.f.index}">Заголовок</label>
        <input class="article_head" name="head" id="article_head_{$smarty.foreach.f.index}" value="{$article.news_head}" />
        <label for="article_date_{$smarty.foreach.f.index}">Дата</label>
        <input class="article_date date_pick" name="date" id="article_date_{$smarty.foreach.f.index}" value="{$article.news_publication_date}" />
        <label for="article_body_{$smarty.foreach.f.index}">Текст</label>
        <textarea class="article_body" name="body" id="article_body_{$smarty.foreach.f.index}" rows="12" cols="100">{$article.news_body}</textarea>
        <button class="save" name="mode" value="Update">Сохранить</button><button class="delete" name="mode" value="Delete">Удалить</button>
      </form>
      {/foreach}
    {/if}
    {include file='admin.set_select.tpl'}
    <form action="/admin/news{if isset($year)}/{$year}/{$month}{/if}" method="post" id="add_article">
      <h2>Добавить новость</h2>
      <label for="article_head_new">Заголовок</label>
      <input class="article_head" name="head" id="article_head_new" value="{$head}" />
      <label for="article_date_new">Дата</label>
      <input class="article_date date_pick" name="date" id="article_date_new" value="{$date}" />
      <label for="article_body_new">Текст</label>
      <textarea class="article_body" name="body" id="article_body_new" rows="12" cols="100">{$body}</textarea>
      <button class="save" name="mode" value="Insert">Добавить</button>
    </form>
   </div>
{/block}