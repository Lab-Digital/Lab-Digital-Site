<div id="services">
   <div class="wrap">
      <section class="middle">
         <h1>Услуги</h1>
         <h2>В которых мы чувствуем себя, как рыба в воде</h2>
         <ul class="services">
            {foreach from=$services item=service}
               <li>
                  <a href="/services/{$service.service_id}">
                     <img src="/images/service{$service.service_id}.png" />
                     <h3>{$service.service_head}</h3>
                     <p class="text">Our notebooks come in three paper types to fit every need – plain, ruled, and dot-grid</p>
                  </a>
               </li>
            {/foreach}
         </ul>
      </section>
   </div>
</div>