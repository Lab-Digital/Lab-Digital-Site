{extends file='page.tpl'}
{block name='title'}{$article.news_meta_title}{/block}
{block name='meta_description'}{$article.news_meta_description}{/block}
{block name='meta_keywords'}{$article.news_meta_keywords}{/block}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
  <link rel="stylesheet" href="/css/styles_for_text.css" />
{/block}
{block name='div.main'}
    {include file="header.tpl"}
    <div class="open">
    {if !empty($article.news_photo_id)}
  		<img src="/scripts/uploads/{$article.news_photo_id}_b.jpg" alt="{$article.news_head}" class="open_image" />
  	{/if}
  	<h1>{$article.news_head}</h1>
    <time>{$article.news_publication_date}</time>
  	<div class="text">{$article.news_body}</div>
  </div>
{/block}
