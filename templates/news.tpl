{extends file='page.tpl'}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
{/block}
{block name='pre_wrap'}
	{include file="header.tpl"}
{/block}
{block name='div.main'}
  <div class="open">
  	<img src="/images/img.jpg" alt="#" class="open_image" />
  	<h1>{$article.news_head}</h1>
    Дата новости {$article.news_publication_date}
  	<div class="text">{$article.news_body}</div>
  </div>
{/block}
