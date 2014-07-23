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
  	<img src="/scripts/uploads/{$article.news_photos[0]}.jpg" alt="#" class="open_image" />
  	<h1>{$article.news_head}</h1>
    <time>{$article.news_publication_date}</time>
  	<div class="text">{$article.news_body}</div>
  </div>
{/block}
