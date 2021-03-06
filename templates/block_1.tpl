{include file="header.tpl"}
<div id="slider_top">
   <div class="right">
      <h1>Оставь заявку</h1>
      <div class="form">
         <form id="proposal">
            <div class="block">
               <input name="top_form_name" id="top_form_name" placeholder="Имя Фамилия" class="form-control" />
            </div>
            <div class="block">
               <input type="mail" name="top_form_mail" id="top_form_mail" placeholder="E-mail" class="form-control" />
            </div>
            <div class="block">
               <input name="top_form_phone" id="top_form_phone" placeholder="Телефон" class="form-control" />
            </div>
            <div class="block">
               <textarea name="top_form_quest" id="top_form_quest" placeholder="Задача" class="form-control"></textarea>
            </div>
            <div class="block">
               <button class="submit" id="submit" type="button" name="submit">Отправить</button>
            </div>
         </form>
      </div>
   </div>
   <ul id="topSliderCtrl">
        <li><a class="active" data-slide-index="0">First</a></li><li><a data-slide-index="1">Second</a></li><li><a data-slide-index="2">Third</a></li>
    </ul>
   <ul class="bxslider">
      {foreach from=$sliders item=slider name=f}
      <li class="slider_{$smarty.foreach.f.index}">
         <div class="wrap">
            <img src="/images/top_logo.png" class="logo" alt="#" />
            <h1>{$slider.slider_head}</h1>
            <h2>{$slider.slider_body}</h2>
         </div>
      </li>
      {/foreach}
   </ul>
   <a class="bottom" href="#projects"></a>
</div>