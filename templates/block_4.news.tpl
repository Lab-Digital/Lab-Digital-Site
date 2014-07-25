<div id="news">
	<div class="wrap">
		<div class="button_left"><button data="0" id="to_left" class="enabled"><</button></div>
	    <div class="button_right"><button data="2" id="to_right" class="enabled">></button></div>
		<section class="middle">
	    	<h1>Новости</h1>
	    	<ul class="news">{include file='block_4.news.li.tpl' articles=$articles.left}</ul><ul class="news">{include file='block_4.news.li.tpl' articles=$articles.middle}</ul><ul class="news">{include file='block_4.news.li.tpl' articles=$articles.right}</ul>
	   </section>
	</div>
</div>