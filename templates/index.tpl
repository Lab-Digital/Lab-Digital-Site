{extends file='page.tpl'}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
  <link href="/css/index.css" rel="stylesheet" />
  <link href="/css/block_1.css" rel="stylesheet" />
  <link href="/css/block_2.cases.css" rel="stylesheet" />
  <link href="/css/block_3.services.css" rel="stylesheet" />
  <link href="/css/block_4.news.css" rel="stylesheet" />
  <script src="/js/js_scroll.js"></script>
  <script src="/js/sticky_header.js"></script>
{/block}
{block name='div.main'}
  {include file="block_1.tpl"}
  {include file="block_2.cases.tpl"}
  {include file="block_3.services.tpl"}
  {include file="block_4.news.tpl"}
{/block}
