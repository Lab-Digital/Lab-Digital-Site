{foreach from=$articles item=article}
   <li>
      <a href="/news/{$article.news_id}"><img src="/images/news.jpg" /><h3>{$article.news_head}</h3><p>{$article.news_description}</p></a>
   </li>
{/foreach}