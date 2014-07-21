{extends file='page.tpl'}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
{/block}
{block name='div.main'}
  {include file="header.tpl"}
  <div class="open">
    <img src="/images/img.jpg" alt="#" class="open_image" />
    <h1>{$service.service_head}</h1>
    <div class="text">
      {$service.service_body}
    </div>
  </div>
{/block}
