<div id="services">
   <div class="wrap">
      <section class="middle">
         <h1>Услуги</h1>
         <h2>В которых мы чувствуем себя, как рыба в воде</h2>
         <ul class="services">
            {foreach from=$services item=service}
               <li>
                  {if !empty($service.service_avatar_id)}
                     <a href="/services/{$service.service_url}">
                        <img src="/scripts/uploads/{$service.service_avatar_id}_s.jpg" />
                        <h3>{$service.service_head}</h3>
                        <p class="text">{$service.service_description}</p>
                     </a>
                  {/if}
               </li>
            {/foreach}
         </ul>
      </section>
   </div>
</div>