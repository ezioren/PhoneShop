$(function () {
    function check_same(target){
        if (target.val() === target.attr('placeholder')) {
            return target.attr('placeholder')
        }else {
            return target.val()
        }
    }

    var changeshow = $('#changeshow li');
    $('#save_change').click(function () {
        var name = check_same(changeshow.eq(0).find('input'));
        var mobile = check_same(changeshow.eq(1).find('input'));
        var email = check_same(changeshow.eq(2).find('input'));
        var sex = check_same(changeshow.eq(3).find('input'));
        var sendaddress = check_same(changeshow.eq(4).find('input'));

        var msg = {
            'name':name,
            'mobile':mobile,
            'email':email,
            'sex':sex,
            'sendaddress':sendaddress
        };

        $.post('accountchange', msg, function (e) {
            alert(e)
            window.location.reload()
        })
    })
})