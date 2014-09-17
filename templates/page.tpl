{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/main.css" rel="stylesheet" />
	<meta name="google-site-verification" content="WHe-4tcrWTHN5CWI8zkUkUO4DLToJ4gLIMDz4py_hME" />
	<!-- Yandex.Metrika counter -->
	<script type="text/javascript">
	(function (d, w, c) {
	    (w[c] = w[c] || []).push(function() {
	        try {
	            w.yaCounter25967419 = new Ya.Metrika({id:25967419,
	                    clickmap:true,
	                    trackLinks:true,
	                    accurateTrackBounce:true});
	        } catch(e) { }
	    });

	    var n = d.getElementsByTagName("script")[0],
	        s = d.createElement("script"),
	        f = function () { n.parentNode.insertBefore(s, n); };
	    s.type = "text/javascript";
	    s.async = true;
	    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

	    if (w.opera == "[object Opera]") {
	        d.addEventListener("DOMContentLoaded", f, false);
	    } else { f(); }
	})(document, window, "yandex_metrika_callbacks");
	</script>
	<noscript><div><img src="//mc.yandex.ru/watch/25967419" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
	<!-- /Yandex.Metrika counter -->
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-54649410-1', 'auto');
	  ga('send', 'pageview');

	</script>
{/block}
{block name='page'}
	<div id="wrap">
       {block name='div.main'}{/block}
	</div>
	{include file="footer.tpl"}
{/block}