{foreach from=$articles item=article}
   <li>
   	  <article><a href="/news/{$article.news_id}"><img src="/scripts/uploads/7_s.jpg" /><h1>{$article.news_head}</h1><time>{$article.news_publication_date}</time><p>{$article.news_description}</p></a></article>
   </li>
{/foreach}