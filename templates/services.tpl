{extends file='page.tpl'}
{block name='links' append}
  <link href="/css/header.css" rel="stylesheet" />
  <link href="/css/open.css" rel="stylesheet" />
  <link href="/css/footer.css" rel="stylesheet" />
{/block}
{block name='pre_wrap'}
	{include file="header.tpl"}
{/block}
{block name='div.main'}
  <div class="open">
  	<img src="/images/img.jpg" alt="#" class="open_image" />
  	<h1>Услуга 1</h1>
  	<div class="text">
  		<p>Donec nisl dolor, lacinia sit amet eleifend sed, suscipit quis nunc. Vestibulum sagittis eu nisi eu vulputate. Vestibulum cursus velit neque, vehicula suscipit neque scelerisque non. Nulla aliquam gravida commodo. Phasellus interdum rutrum quam. Morbi non posuere risus, iaculis mattis nunc.</p>
  		<p>In mollis ipsum massa, eu adipiscing ante aliquam in. Fusce non varius nibh, a ultricies sem. Aliquam a odio tempus, pulvinar quam vitae, viverra mauris. Nulla pharetra aliquet tellus vulputate congue. Suspendisse id venenatis enim. Suspendisse potenti. Suspendisse eu tincidunt ipsum. Sed lobortis vestibulum quam sed scelerisque.</p>
  	</div>
  </div>
{/block}
