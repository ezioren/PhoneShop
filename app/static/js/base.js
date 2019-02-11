$(function () {
    //顶部购物车
    $('#nav-cart').mouseenter(function () {
        $('#top-cart-menu').stop().slideDown(500)
        $(this).find('a').addClass('top-cart-active');
    }).mouseleave(function () {
        $('#top-cart-menu').stop().slideUp(500)
        $(this).find('a').removeClass('top-cart-active');
    })

})