$(function(){
    var HeaderTop = 0;
    
    $(window).scroll(function(){
        if( $(window).scrollTop() > HeaderTop ) {
            $('header').slideDown();
        } else {
            $('header').slideUp();
        }
    });
});