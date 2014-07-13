<div id="block_3">
   <section class="middle">
      <h1>Услуги</h1>
      <h2>В которых мы чувствуем себя, как рыба в воде</h2>
      <ul class="services">
         {foreach from=$services item=service}
            <li>
               <a href="/services/{$service.service_id}">
                  <div class="img"></div>
                  <h3>{$service.service_head}</h3>
               </a>
            </li>
         {/foreach}
      </ul>
   </section>
</div>