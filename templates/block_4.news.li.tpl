{foreach from=$articles item=article}
<li>
  <article><a href="/news/{$article.news_id}">{if !empty($article.news_photo_id)}<img src="/scripts/uploads/{$article.news_photo_id}_s.jpg" />{/if}<h1>{$article.news_head}</h1><time>{$article.news_publication_date}</time><p>{$article.news_description}</p></a></article>
</li>
{/foreach}