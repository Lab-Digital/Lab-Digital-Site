$(function(){
	$('div.in input[name^="avatar"]').change(function(){
		$a = $(this).attr('data').split('_');
		$news = $a[0];
		$photo = $a[1];
	});
});