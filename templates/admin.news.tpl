{extends file='admin.tpl'}
{block name='title' append} - Новости{/block}
{block name='links' append}
   <link rel="stylesheet" type="text/css" href="/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
   <script type="text/javascript" src="/fancybox/jquery.fancybox-1.3.4.js"></script>
   <script src="/js/nicEdit.js"></script>
   <script> 
	   	$(function(){
	   		$('textarea[name="body"]').each(function() {
	   			new nicEditor().panelInstance($(this).attr('id'));
	   		});
	   	}); 
   </script>
   <script src="/js/select_plugin.js"></script>
   <script src="/upload_photo/js/plugin.js"></script>
   <script src="/js/dropdown_blocks.js"></script>
   <script>
   {literal}
   $(function(){
    $('div.photos_in button.upload').each(function(){
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
    $('div.avatar_in button.upload').each(function(){
      $data = $(this).attr('data');
      $(this).getUpload({
         'uploadType'  : 'news',
         'isAvatar'    : 'true',
         'item_id'     :  $data,
         'width'       : '300',
         'height'      : '200',
         'count'       : '1',
         'afterResize' : '1024',
         'sizes'       : 's#300#200'
      });
    });
    $('a[rel^="gallery"]').fancybox();
    $('div.avatar_in a').fancybox();
    $('aside a.dropdown_head').append('<div class="arrow"></div>');
   });
   {/literal}
   </script>
   <script src="/js/images.js"></script>
{/block}
{block name='main'}
   <h1>Новости</h1>
   {if isset($error_txt)}<p class="db_error">{$error_txt}</p>{/if}
   <aside class="menu">{$article_menu}</aside>
   {if !empty($year)}
   <script type="text/javascript">
       $('#year_{$year}').addClass('open').siblings('ul.dropdown_block').show();
   </script>
   {/if}
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
            <input name="head" id="article_head_{$smarty.foreach.f.index}" value="{$head|default:$article.news_head}" />
          </div>
          <div class="form_block">
            <label for="title_{$smarty.foreach.f.index}">Meta title</label>
            <input id="title_{$smarty.foreach.f.index}" name="title" value="{$meta_title|default:$article.news_meta_title}" />
          </div>
          <div class="form_block">
            <label for="description_{$smarty.foreach.f.index}">Описание новости</label>
            <textarea name="desc" id="description_{$smarty.foreach.f.index}" rows="2" cols="100">{$desc|default:$article.news_description}</textarea>
          </div>
          <div class="form_block">
            <label for="body_{$smarty.foreach.f.index}">Текст</label>
            <textarea name="body" id="body_{$smarty.foreach.f.index}" rows="12" cols="100">{$body|default:$article.news_body}</textarea>
          </div>
          <div class="form_block">
             <label for="meta_description_{$smarty.foreach.f.index}">Meta description</label>
             <textarea name="description" id="meta_description_{$smarty.foreach.f.index}" cols="90" rows="10">{$meta_description|default:$article.news_meta_description}</textarea>
          </div>
          <div class="form_block">
             <label for="keywords_{$smarty.foreach.f.index}">Meta keywords</label>
             <textarea name="keywords" id="keywords_{$smarty.foreach.f.index}" cols="90" rows="10">{$meta_keywords|default:$article.news_meta_keywords}</textarea>
          </div>
          <div class="buttons"><button class="save" name="mode" value="Update">Сохранить</button><button class="delete red" name="mode" value="Delete">Удалить</button></div>
        </form>
        <div class="in photos_in">
          <h1 class="head_upload">Фото</h1>
          <button class="upload" type="submit" data="{$article.news_id}">Загрузить фото</button>
          <ul>
            {foreach from=$article.news_photos item=photo}{if $photo != $article.news_photo_id}<li><a href="/scripts/uploads/{$photo}_b.jpg" rel="gallery_{$article.news_id}"><img src="/scripts/uploads/{$photo}_s.jpg" /></a><button class="x" data="{$photo}">x</button></li>{/if}{/foreach}
          </ul>
        </div>
        <div class="in avatar_in">
          <h1 class="head_upload">Главное фото</h1>
          <button class="upload" type="submit" data="{$article.news_id}">Загрузить главное фото</button>
          <ul>
            {if !empty($article.news_photo_id)}<li><a href="/scripts/uploads/{$article.news_photo_id}_b.jpg"><img src="/scripts/uploads/{$article.news_photo_id}_s.jpg" /></a><button class="x" data="{$article.news_photo_id}">x</button></li>{/if}
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