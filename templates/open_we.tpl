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
  	<img src="/images/img2.jpg" alt="#" class="open_image" />
  	<h1>Наша команда</h1>
  	<div class="text">{$about.texts_body}</div>
  </div>
{/block}