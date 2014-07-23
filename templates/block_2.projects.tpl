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
                     {if !empty($project.texts_photo_id)}<img src="/scripts/uploads/{$project.texts_photo_id}.jpg" />
                     <h3>{$project.texts_head}</h3> {*{$project.texts_id}*}
                  </a>
               </li>
            {/foreach}
         </ul>
      </section>

   </div>
</div>