{extends file='page.tpl'}
{block name='title'}{$service.service_meta_title}{/block}
{block name='meta_description'}{$service.service_meta_description}{/block}
{block name='meta_keywords'}{$service.service_meta_keywords}{/block}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
{/block}
{block name='div.main'}
  {include file="header.tpl"}
  <div class="open">
    {if !empty($service.service_photo_id)}<img src="/scripts/uploads/{$service.service_photo_id}_b.jpg" alt="{$service.service_head}" class="open_image" />{/if}
    <h1>{$service.service_head}</h1>
    <div class="text">{$service.service_body}</div>
  </div>
{/block}
