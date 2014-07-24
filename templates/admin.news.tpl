{extends file='admin.tpl'}
{block name='title' append} - Новости{/block}
{block name='links' append}
   <script src="/js/select_plugin.js"></script>
   <script src="/js/select_avatar.js"></script>
   <script src="/upload_photo/js/plugin.js"></script>
   <script>
   {literal}
   $(function(){
    $('div.in button.upload').each(function(){
      $data = $(this).attr('data');
      $(this).getUpload({
         'uploadType'  : 'news',
         'item_id'     :  $data,
         'width'       : '300',
         'height'      : '200',
         'count'       : '5',
         'afterResize' : '1024',
         'sizes'       : 's#300#200'
      });
    });

   });
   {/literal}
   </script>
   <script src="/js/images.js"></script>
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
        <script type="text/javascript">
          $('#choose_item option[value="{$item_id}"]').attr('selected', 'selected');
        </script>
        <h2>Редактирование новости</h2>
      {/if}
      {foreach from=$articles item=article name=f}
      <div class="edit">
        <form action="/admin/news/{$year}/{$month}" method="post" class="item_edit" id="item{$article.news_id}">
          <input type="hidden" class="article_id" name="id" value="{$article.news_id}" />
          <div class="form_block">
            <label for="article_head_{$smarty.foreach.f.index}">Заголовок</label>
            <input class="article_head" name="head" id="article_head_{$smarty.foreach.f.index}" value="{$head|default:$article.news_head}" />
          </div>
          <div class="form_block">
            <label for="title_{$smarty.foreach.f.index}">Meta title</label>
            <input id="title_{$smarty.foreach.f.index}" name="title" value="{$meta_title|default:$article.news_meta_title}" />
          </div>
          <div class="form_block">
            <label for="description_{$smarty.foreach.f.index}">Описание новости</label>
            <textarea class="article_body" name="desc" id="description_{$smarty.foreach.f.index}" rows="2" cols="100">{$desc|default:$article.news_description}</textarea>
          </div>
          <div class="form_block">
            <label for="body_{$smarty.foreach.f.index}">Текст</label>
            <textarea class="article_body" name="body" id="body_{$smarty.foreach.f.index}" rows="12" cols="100">{$body|default:$article.news_body}</textarea>
          </div>
          <div class="form_block">
             <label for="meta_description_{$smarty.foreach.f.index}">Meta description</label>
             <textarea id="meta_description_{$smarty.foreach.f.index}" name="description" cols="90" rows="10">{$meta_description|default:$article.news_meta_description}</textarea>
          </div>
          <div class="form_block">
             <label for="keywords_{$smarty.foreach.f.index}">Meta keywords</label>
             <textarea id="keywords_{$smarty.foreach.f.index}" name="keywords" cols="90" rows="10">{$meta_keywords|default:$article.news_meta_keywords}</textarea>
          </div>
          <div class="buttons"><button class="save" name="mode" value="Update">Сохранить</button><button class="delete red" name="mode" value="Delete">Удалить</button></div>
        </form>
        <div class="in">
          <button class="upload" type="submit" data="{$article.news_id}">Загрузить фото</button>
          <ul>
            {foreach from=$article.news_photos item=photo}<li><a href="/scripts/uploads/{$photo}_b.jpg" class="gallery"><img src="/scripts/uploads/{$photo}_s.jpg" /></a><button class="x" data="{$photo}">x</button><input type="radio" id="i{$photo}" data="{$article.news_id}_{$photo}" {if $article.news_photo_id == $photo}checked="checked"{/if} name="avatar{$article.news_id}" /></li>{/foreach}
          </ul>
        </div>
      </div>
      {/foreach}
    {/if}
    {include file='admin.set_select.tpl'}
    {if !$isInsert}
       {assign var='head' value=''}
       {assign var='desc' value=''}
       {assign var='body' value=''}
       {assign var='meta_title' value=''}
       {assign var='meta_keywords' value=''}
       {assign var='meta_description' value=''}
    {/if}
    <h2>Добавить новость</h2>
    <div class="add">
      <form action="/admin/news{if isset($year)}/{$year}/{$month}{/if}" method="post" id="add_article">
        <div class="form_block">
          <label for="article_head_new">Заголовок</label>
          <input name="head" id="article_head_new" value="{$head}" />
        </div>
        <div class="form_block">
           <label for="title_new">Meta title</label>
           <input name="title" id="title_new" value="{$meta_title}" />
        </div>
        <div class="form_block">
          <label for="article_description_new">Описание новости</label>
          <textarea name="desc" id="article_description_new" rows="2" cols="100">{$desc}</textarea>
        </div>
        <div class="form_block">
          <label for="article_body_new">Текст</label>
          <textarea name="body" id="article_body_new" rows="12" cols="100">{$body}</textarea>
        </div>
        <div class="form_block">
           <label for="description_new">Meta description</label>
           <textarea name="description" id="description_new" cols="90" rows="10">{$meta_description}</textarea>
        </div>
        <div class="form_block">
           <label for="keywords_new">Meta keywords</label>
           <textarea name="keywords" id="keywords_new" cols="90" rows="10">{$meta_keywords}</textarea>
        </div>
        <div class="buttons"><button class="save" name="mode" value="Insert">Добавить</button></div>
      </form>
    </div>
  </div>
{/block}