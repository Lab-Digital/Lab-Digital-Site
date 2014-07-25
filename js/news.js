$(function(){
	$("body").on('click', '#to_left.enabled', function(){
		alert('left');
	});

	$("body").on('click', '#to_right.enabled', function(){
		alert('right');
		//enableButton('left');
	});
});

function disableButton(button) {
	$('#to_' + button).removeClass('enabled').addClass('disabled');
}

function enableButton(button) {
	$('#to_' + button).removeClass('disabled').addClass('enabled');
}