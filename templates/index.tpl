{extends file='page.tpl'}
{block name='title'}{$meta.index_meta_title}{/block}
{block name='meta_description'}{$meta.index_meta_description}{/block}
{block name='meta_keywords'}{$meta.index_meta_keywords}{/block}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
  <link href="/css/index.css" rel="stylesheet" />
  <link href="/css/block_1.css" rel="stylesheet" />
  <link href="/css/block_2.projects.css" rel="stylesheet" />
  <link href="/css/block_3.services.css" rel="stylesheet" />
  <link href="/css/block_4.news.css" rel="stylesheet" />
  <link href="/css/block_5.we.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
  <link href="/css/jquery.bxslider.css" rel="stylesheet" />
  <script src="/js/js_scroll.js"></script>
  <script src="/js/news.js"></script>
  <script src="/js/sticky_header.js"></script>
  <script src="/js/jquery.bxslider.js"></script>
  <link href="/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" media="screen" />
  <script src="/fancybox/jquery.fancybox-1.3.4.js"></script>
  <script src="/js/send_to_mail.js"></script>
  <script>
  $(function(){
      $('.bxslider').bxSlider({
        'controls': false,
        'pagerCustom': '#topSliderCtrl',
        'speed': 1000,
        'easing': 'ease-in-out',
        'adaptiveHeight': false,
        'infiniteLoop': false
      });
    });
  </script>
{/block}
{block name='div.main'}
  {include file="block_1.tpl"}
  {include file="block_2.projects.tpl"}
  {include file="block_3.services.tpl"}
  {include file="block_5.we.tpl"}
  {include file="block_4.news.tpl"}
{/block}
