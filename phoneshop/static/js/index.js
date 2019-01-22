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
    //$("#div").stop();//停止当前动画，继续下一个动画
    //抬头下拉菜单
    $('#header-nav-list').mouseenter(function () {
        $('#header-nav-goods-show').stop().slideDown(500)
    }).mouseleave(function () {
        $('#header-nav-goods-show').stop().slideUp(500)
    })
    //轮播图
    var swiper = new Swiper('#goods-show .container', {
        loop: true,
        spaceBetween: 30,
        centeredSlides: true,
        speed: 2000,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        autoplayDisableOnInteraction: false,
        pagination: {
            el: '#goods-show .swiper-pagination',
            clickable: true,
            renderBullet: function (index, className) {
                return '<span class="' + className + '"></span>';
            },
        },
            navigation: {
                nextEl: '#goods-show .button-next',
                prevEl: '#goods-show .button-prev',
            },
    });

})