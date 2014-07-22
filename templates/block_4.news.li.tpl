{foreach from=$articles item=article}
   <li>
   	  <article><a href="/news/{$article.news_id}"><img src="/images/news.jpg" /><h1>{$article.news_head}</h1><p>{$article.news_description}</p></a></article>
   </li>
{/foreach}