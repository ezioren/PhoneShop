$(function () {
    // 判断非空
    function isEmpty(target){
        if (target.val()=="" || target.val()==null){
            target.parent().parent().find('.error-msg').show()
        }else {
            target.parent().parent().find('.error-msg').hide()
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

    $('form').submit(function () {
        var target = $('#username').val()
        var pwd = $('#password').val()
        $.post('loginhandle', {'target':target, 'password':pwd}, function (data) {
            alert(data)
        }, 'text')
    })
})