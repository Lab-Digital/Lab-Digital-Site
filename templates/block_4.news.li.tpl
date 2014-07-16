{foreach from=$articles item=article}
   <li>
      <a href="/news/{$article.news_id}">
         <div class="img"></div>
         <h3>{$article.news_head}</h3>
         <p>{$article.news_body}</p>
      </a>
   </li>
{/foreach}