function linkTouchStart(selector){
    $(selector)
        .on('touchstart', function(){
            $(this).addClass('m-hover');
        }).on('touchend', function(){
            $(this).removeClass('m-hover');
        });
}
$(function(){
    $('#nav-toggle, .nav-links>li')
        .on('touchstart', function(){
            $(this).addClass('m-hover');
        }).on('touchend', function(){
            $(this).removeClass('m-hover');
        });
    $('#nav-toggle')
        .on('touchstart', function(){
            $('.mobile_hanbager_nav').toggleClass('open');
            $("nav-content").slideToggle(500);
        }).on('touchend', function(){
        });
});
