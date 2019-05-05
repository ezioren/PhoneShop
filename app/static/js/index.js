$(function () {
    //$("#div").stop();//停止当前动画，继续下一个动画
    //抬头下拉菜单
    var handel = function () {
        $('#header-nav-goods-show').stop().slideDown(500)
    }
    var handel2 = function () {
        $('#header-nav-goods-show').stop().slideUp(500)
    };
    $('#header-nav-list li:first-child').siblings().mouseenter(handel).mouseleave(handel2)

    //轮播图
    var swiper = new Swiper('#goods-lunbo .container', {
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
            el: '#goods-lunbo .swiper-pagination',
            clickable: true,
            renderBullet: function (index, className) {
                return '<span class="' + className + '"></span>';
            },
        },
            navigation: {
                nextEl: '#goods-lunbo .button-next',
                prevEl: '#goods-lunbo .button-prev',
            },
    });
    // 配件区域切换监听
    $('#pj-goods-show .pj-goods-address').find('li').mouseenter(function () {
        $(this).addClass('type-active').siblings().removeClass('type-active')
        $('#pj-goods-show .body .right ul').eq($(this).index()).show().siblings().hide()
    })

    // 为你推荐切换监听
    var num1=0 //控制左右一定次数
    var num2=0
    $('#button-box-next').click(function () {
        num2-=1240;
        $('#wntj-goods-box').animate({
                marginLeft:num2+'px',
        },1000)
        $('#button-box-prev').removeClass('button-active')
        if (num1 >= 0 ){
            $(this).addClass('button-active')
        }
        num1+=1
    })
    $('#button-box-prev').click(function () {
        num2+=1240;
        $('#wntj-goods-box').animate({
                marginLeft:num2+'px',
        },1000)
        $('#button-box-next').removeClass('button-active')
        if (num1 <= 1 ){
            $(this).addClass('button-active')
        }
        num1-=1
    })
})