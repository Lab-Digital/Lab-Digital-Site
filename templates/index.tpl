{extends file='page.tpl'}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
  <link href="/css/index.css" rel="stylesheet" />
{/block}
{block name='pre_wrap'}
  {include file="header.tpl"}
{/block}
{block name='div.main'}
  {include file="block_1.tpl"}
  <a name="cases"></a>
  {include file="block_2.cases.tpl"}
  <a name="services"></a>
  {include file="block_3.services.tpl"}
  <a name="news"></a>
  {include file="block_4.news.tpl"}
{/block}
