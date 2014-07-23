<div id="services">
   <div class="wrap">
      <section class="middle">
         <h1>Услуги</h1>
         <h2>В которых мы чувствуем себя, как рыба в воде</h2>
         <ul class="services">
            {foreach from=$services item=service}
               <li>
                  {if !empty($service.service_photo_id)}
                     <a href="/services/{$service.service_id}">
                        <img src="/scripts/uploads/{$service.service_photo_id}_s.jpg" />
                        <h3>{$service.service_head}</h3>
                        <p class="text">Our notebooks come in three paper types to fit every need – plain, ruled, and dot-grid</p>
                     </a>
                  {/if}
               </li>
            {/foreach}
         </ul>
      </section>
   </div>
</div>