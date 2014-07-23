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
  	{if !empty($article.news_photo_id)}<img src="/scripts/uploads/{$article.news_photo_id}.jpg" alt="#" class="open_image" />{/if}
  	<h1>{$article.news_head}</h1>
    <time>{$article.news_publication_date}</time>
  	<div class="text">{$article.news_body}</div>
  </div>
{/block}
