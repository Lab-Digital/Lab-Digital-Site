$(function(){
	$('div.in button.url').click(function(){
		$id = $(this).attr('data');
		prompt('URL фотографии для вставки в текст', 'lab-digital.ru/scripts/uploads/' + $id + '_b.jpg');
	});
});