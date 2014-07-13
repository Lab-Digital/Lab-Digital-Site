{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/main.css" rel="stylesheet" />
{/block}
{block name='page'}
	{block name='pre_wrap'}{/block}
	<div id="wrap">
       {block name='div.main'}{/block}
	</div>
	{include file="footer.tpl"}
{/block}