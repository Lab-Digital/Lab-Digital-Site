<div id="block_2">
   <section class="middle">
      <h1>Проекты</h1>
      <h2>Как мы помогаем продать клиентам больше</h2>
      <ul class="cases">
         {foreach from=$projects item=project}
            <li>
               <div class="img"></div>
               <h3>{$project.texts_head}</h3> {*{$project.texts_id}*}
            </li>
         {/foreach}
      </ul>
   </section>
</div>