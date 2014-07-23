{extends file='page.tpl'}
{block name='title' append} - Новости - {$article.news_head}{/block}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
{/block}
{block name='div.main'}
    {include file="header.tpl"}
    <div class="open">
  	<img src="/images/img.jpg" alt="#" class="open_image" />
  	<h1>{$article.news_head}</h1>
    Дата новости {$article.news_publication_date}
  	<div class="text">{$article.news_body}</div>
  <ul>
    {foreach from=$article.news_photos item=photo}
    {if $article.news_photo_id != $photo}
      <li><a href="/scripts/uploads/{$photo}_b.jpg" class="gallery"><img src="/scripts/uploads/{$photo}_s.jpg" /></a></li>
    {/if}
    {/foreach}
  </ul>
  </div>
{/block}
