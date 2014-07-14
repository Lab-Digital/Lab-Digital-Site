<div id="block_4">
   <section class="middle">
      <h1>Новости</h1>
      <ul class="news">
         {foreach from=$articles item=article}
            <li>
               <a href="/news/{$article.news_id}">
                  <div class="img"></div>
                  <h3>{$article.news_head}</h3>
                  <p>{$article.news_body}</p>
               </a>
            </li>
         {/foreach}
      </ul>
   </section>
</div>