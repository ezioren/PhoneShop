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
    //轮播图
    var swiper = new Swiper('#goods-show .container', {
        loop: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 100000,
            disableOnInteraction: false,
        },
        autoplayDisableOnInteraction: false,
        pagination: {
            el: '#goods-show .goods-show-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '#goods-show .button-next',
            prevEl: '#goods-show .button-prev',
        },

    });
})