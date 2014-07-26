$(function(){
    var HeaderTop = $('header').offset().top;
    
    $(window).resize(function() {
        HeaderTop = $('header').offset().top;
        if( $(window).scrollTop() > HeaderTop ) {
            $('header').css({position: 'fixed', top: '0px'});
            $('#sticky_header').css({height: '76px'});
        } else {
            $('header').css({position: 'static'});
            $('#sticky_header').css({height: '0px'});
        }
    });

    $(window).scroll(function(){
        if( $(window).scrollTop() > HeaderTop ) {
            $('header').css({position: 'fixed', top: '0px'});
            $('#sticky_header').css({height: '76px'});
        } else {
            $('header').css({position: 'static'});
            $('#sticky_header').css({height: '0px'});
        }
    });

    $('header div.small_screen img.open_menu').click(function() {
        $('header div.small_screen nav').slideToggle();
    });

    $('header div.small_screen nav li a').click(function() {
        $('header div.small_screen nav').slideUp();
    });
});