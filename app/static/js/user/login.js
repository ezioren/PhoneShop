$(function () {
    // 判断非空
    function isEmpty(target){
        if (target.val()=="" || target.val()==null){
            target.parent().parent().find('.error-msg').show()
            return true
        }else {
            target.parent().parent().find('.error-msg').hide()
            return false
        }
    }

    //用户
    $('#username').blur(function () {
        isEmpty($(this))
    })

    //密码
    $('#password').blur(function () {
        isEmpty($(this))
    })

    function formatSearch(se){
            if (typeof se !== "undefined") {
                se = se.substr(1);
                var arr = se.split("&"),
                    obj = {},
                    newarr = [];
                $.each(arr, function(i, v){
                    newarr = v.split("=");
                    if(typeof obj[newarr[0]] === "undefined"){
                        obj[newarr[0]] = newarr[1];
                    }
                });
                return obj;
            };
    }

    $('form').submit(function () {
        var pwd = $('#password').val()
        var target = $('#username').val()
        var settime = $('input[type="checkbox"]').prop('checked')
        var obj = formatSearch(location.search)
        $.post('login', {'target':target, 'password':pwd, 'settime': settime}, function (data) {
            alert(data)
            if (obj['next'] == null){
            window.location.href = location.origin + '/index'
            }else {
            window.location.href = location.origin + '/' +obj['next']
            }
        }, "text")

    })
})