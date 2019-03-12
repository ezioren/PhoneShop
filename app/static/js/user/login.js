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

    $('form').submit(function () {
        var pwd = $('#password').val()
        var target = $('#username').val()
        var settime = $('input[type="checkbox"]').prop('checked')

        $.post('loginhandle', {'target':target, 'password':pwd, 'settime': settime}, function (data) {
            alert(data)
        }, 'text')
    })
})