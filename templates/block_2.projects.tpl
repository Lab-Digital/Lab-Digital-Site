<div id="projects">
   {include file="header.tpl"}
   <div class="wrap">
      <section class="middle">
         <h1>Проекты</h1>
         <h2>Как мы помогаем продать клиентам больше</h2>
         <ul class="projects">
            {foreach from=$projects item=project}
               {if !empty($project.texts_photo_id)}
                  <li>
                     <a href="/projects/{$project.texts_id}">
                        <img src="/scripts/uploads/{$project.texts_photo_id}_s.jpg" />
                        <h3>{$project.texts_head}</h3> {*{$project.texts_id}*}
                     </a>
                  </li>
               {/if}
            {/foreach}
         </ul>
      </section>

   </div>
</div>