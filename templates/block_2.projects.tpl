<div id="projects">
   {include file="header.tpl"}
   <div class="wrap">
      <section class="middle">
         <h1>Проекты</h1>
         <h2>Как мы помогаем продать клиентам больше</h2>
         <ul class="projects">
            {foreach from=$projects item=project}
               <li>
                  <a href="/projects">
                     <img src="/images/projects{$project.texts_id}.jpg" />
                     <h3>{$project.texts_head}</h3> {*{$project.texts_id}*}
                  </a>
               </li>
            {/foreach}
         </ul>
      </section>

   </div>
</div>