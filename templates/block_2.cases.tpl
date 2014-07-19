<div id="cases">
   {include file="header.tpl"}
   <div class="wrap">
      <section class="middle">
         <h1>Проекты</h1>
         <h2>Как мы помогаем продать клиентам больше</h2>
         <ul class="cases">
            {foreach from=$projects item=project}
               <li>
                  <img src="/images/cases{$project.texts_id}.jpg" />
                  <h3>{$project.texts_head}</h3> {*{$project.texts_id}*}
               </li>
            {/foreach}
         </ul>
      </section>

   </div>
</div>