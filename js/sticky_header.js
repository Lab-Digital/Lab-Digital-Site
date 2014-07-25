$(function(){
    var HeaderTop = $('header').offset().top;
    $(window).scroll(function(){
        if( $(window).scrollTop() > HeaderTop ) {
            $('header').css({position: 'fixed', top: '0px'});
            $('#sticky_header').css({height: '76px'});
        } else {
            $('header').css({position: 'static'});
            $('#sticky_header').css({height: '0px'});
        }
    });
});