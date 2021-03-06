{extends file='page.tpl'}
{block name='title'}{$project.texts_meta_title}{/block}
{block name='meta_description'}{$project.texts_meta_description}{/block}
{block name='meta_keywords'}{$project.texts_meta_keywords}{/block}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
  <link rel="stylesheet" href="/css/styles_for_text.css" />
{/block}
{block name='div.main'}
  {include file="header.tpl"}
  <div class="open">
    <img src="/scripts/uploads/{$project.texts_photo_id}_b.jpg" alt="{$project.texts_head}" class="open_image" />
    <h1>{$project.texts_head}</h1>
    <div class="text">{$project.texts_body}</div>
  </div>
{/block}
