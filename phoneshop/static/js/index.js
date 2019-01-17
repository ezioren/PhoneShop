$(function () {
    //顶部购物车
    $('nav .nav-cart').mouseenter(function () {
        $(this).find('.top-cart').addClass('top-cart-active');
        $('#top-cart-menu').animate({
            height:'toggle'},'slow');
    }).mouseleave(function (){
                $('#top-cart-menu').animate({
                        height:'toggle'
                    },'slow', function () {
                });
                $(this).find('.top-cart').removeClass('top-cart-active');

    });
    $('')
})