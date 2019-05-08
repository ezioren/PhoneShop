$(function () {
    // 判断非空
    function isEmpty(target) {
        if (target.val() == "" || target.val() == null) {
            target.parent().parent().find('.error-msg').show()
        } else {
            target.parent().parent().find('.error-msg').hide()
        }
    }

    //用户
    $('#username').keyup(function () {
        if ($(this).val().length > 50) {
            var lenText = $(this).val().substring(0, 50)
            $(this).val(lenText)
            $('#username').parent().parent().find('.error-msg').html('用户名过长');
            $('#username').parent().parent().find('.error-msg').show();
        } else {
            $('#username').parent().parent().find('.error-msg').html('用户名不能为空');
            $('#username').parent().parent().find('.error-msg').hide();
        }
    }).blur(function () {
        if ($(this).val().length == 0) {
            isEmpty($(this))
        } else {
            $.get('registerhandle', {'source': $(this).val(), 'name': 'username'}, function (data) {
                if (data == 'exited') {
                    $('#username').parent().parent().find('.error-msg').html('该用户名已注册');
                    $('#username').parent().parent().find('.error-msg').show();
                } else if (data == 'not' && $('#username').val().length > 0) {
                    $('#username').parent().parent().find('.error-msg').html('用户名不能为空');
                    $('#username').parent().parent().find('.error-msg').hide();
                } else {
                    $('#username').parent().parent().find('.error-msg').html('用户名不能为空');
                    isEmpty($('#username'))
                }
            })
        }
    })

    // 邮箱补全及检测空值
    $('#email').autocomplete({
        autoFocus: true,
        delay: 0,
        source: function (request, response) {
            var hosts = ['qq.com', '163.com', 'gmail.com'],
                term = request.term, //获取用户输入内容
                name = term, //邮箱的用户名
                host = "",  //邮箱的域名
                ix = term.indexOf('@'),  //@的位置
                result = [];  //最终呈现的邮箱列表

            result.push(term);

            //当有@的时候，重新分配用户名和域名
            if (ix > -1) {
                name = term.slice(0, ix); // @前面的name
                host = term.slice(ix + 1); // @后面的域名
            }

            if (name) {
                var findedHosts;
                if (host) {
                    // 用户已经输入@和后面的域名
                    // 找到相关的域名信息
                    findedHosts = $.grep(hosts, function (value, index) {
                        return value.indexOf(host) > -1;
                    });
                } else {
                    //用户没有输入@
                    //提示所有的域名
                    findedHosts = hosts;
                }
                //如果findedHosts为空，return也是空
                var findedResult = $.map(findedHosts, function (value, index) {
                    return name + '@' + value;
                });

                result = result.concat(findedResult);
            }
            response(result);
        },
    }).blur(function () {
        if ($(this).val().length > 0) {
            $.get('registerhandle', {'source': $(this).val(), 'name': 'email'}, function (data) {
                if (data == 'exited') {
                    $('#email').parent().parent().find('.error-msg').html('该邮箱已注册');
                    $('#email').parent().parent().find('.error-msg').show();
                } else if (data == 'not') {
                    $('#email').parent().parent().find('.error-msg').html('邮箱不能为空');
                    $('#email').parent().parent().find('.error-msg').hide();
                } else {
                    $('#email').parent().parent().find('.error-msg').html('邮箱不能为空');
                    isEmpty($('#email'))
                }
            })
        } else {
            isEmpty($('#email'))
        }
    })


    // 手机
    // 只能输入数字，非数字自动删除
    $('#phonenum').blur(function () {
        if ($(this).val().length == 0) {
            isEmpty($(this))
        }
        $.get('registerhandle', {'source': $(this).val(), 'name': 'phone'}, function (data) {
            if (data == 'exited') {
                $('#phonenum').parent().parent().find('.error-msg').html('该手机号已注册');
                $('#phonenum').parent().parent().find('.error-msg').show();
            } else if (data == 'not' && $('#phonenum').val().length > 0) {
                $('#phonenum').parent().parent().find('.error-msg').html('手机号不能为空');
                $('#phonenum').parent().parent().find('.error-msg').hide();
            } else {
                $('#phonenum').parent().parent().find('.error-msg').html('手机号不能为空');
            }
        })
    }).keyup(function () {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    }).bind("paste", function () {
        $(this).val($(this).val().replace(/[^0-9]/g, ''));
    })

    // 检查密码复杂度
    function checkpwdfuza(source, target) {
        var grade = 0
        // 密码为八位及以上并且字母数字特殊字符三项都包括，强
        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
        //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
        var mediumRegex = new RegExp("^(?=.{8,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
        var enoughRegex = new RegExp("(?=.{8,}).*", "g");

        if (strongRegex.test(source.val())) {
            target.text('强!');
            grade = 3;
        } else if (mediumRegex.test(source.val())) {
            target.text('中等!');
            grade = 2;
        } else if (true == enoughRegex.test(source.val())) {
            target.text('弱!');
            grade = 1;
        } else {
            target.text('');
        }
        return grade
    }

    function checkpwdlength(source, target, show, grade) {
        // 验证长度
        var inputlen = source.val().length
        var textmax = source.attr('maxlength')
        var boxlen = target.css('width')

        var boxbgwidth = (inputlen / parseInt(textmax)) * parseInt(boxlen) - 7

        show.css("background-color", "#F00");
        if (grade == 3) {
            if (boxbgwidth > 210) {
                show.css("background-color", "#6F3");
            }
            if (boxbgwidth > 105) {
                show.css("background-color", "#F90");
            }
            show.css('width', boxbgwidth)
        } else if (grade == 2) {
            if (boxbgwidth > 210) {
                boxbgwidth = 210
            }
            if (boxbgwidth > 105) {
                show.css("background-color", "#F90");
            }
            show.css('width', boxbgwidth)
        } else if (grade == 1) {
            if (boxbgwidth > 105) {
                boxbgwidth = 105
            }
            show.css('width', boxbgwidth)
        } else {
            boxbgwidth = 0
            show.css('width', boxbgwidth)
        }
        if (inputlen == 0) {
            source.parent().parent().find('.error-msg').html('密码不能为空')
            source.parent().parent().find('.error-msg').show()
        } else if (inputlen < 8) {
            source.parent().parent().find('.error-msg').html('密码不能少于8位')
            source.parent().parent().find('.error-msg').show()
        } else {
            source.parent().parent().find('.error-msg').hide()
        }
    }

    //密码
    $('#password').keyup(function () {
        var garde = checkpwdfuza($(this), $('#password-box-html'))
        checkpwdlength($(this), $('#password-box'), $('#password-box-html'), garde)
    }).blur(function () {
        var garde = checkpwdfuza($(this), $('#password-box-html'))
        checkpwdlength($(this), $('#password-box'), $('#password-box-html'), garde)
    })

    // 验证密码前后一致
    $('#surePassword').blur(function () {
        if ($(this).val() != $('#password').val()) {
            $(this).parent().parent().find('.error-msg').show()
        } else {
            $(this).parent().parent().find('.error-msg').hide()
        }
    });

    // 限制性别选择
    function isSex(target) {
        if (target.prop("checked")) {
            target.siblings().prop("disabled", "true");
        } else {
            target.siblings().prop("disabled", "");
        }
    }

    // 性别
    $('#checkbox-man').click(function () {
        isSex($(this))
    });
    $('#checkbox-woman').click(function () {
        isSex($(this))
    });

    // 提交前检查是否有空
    function checkIsEmpty(target) {
        var duixiang = target.parent().parent().find('.error-msg')
        if (target.val() == "" || target.val() == null || duixiang.html() == "该用户名已注册" || duixiang.html() == "该手机号已注册") {
            // event.preventDefault() // 拦截form,不执行跳转
            return duixiang.html()
        }
    }

    $('#register-submit').click(function () {
        var alertShow = "";
        var sex = "";
        var checkList = [$('#username'), $('#email'), $('#phonenum')];
        var checkSex = $('input[type="checkbox"]');
        $.each(checkList, function (i) {
            var duixiang = checkIsEmpty(checkList[i]);
            if (duixiang) {
                alertShow += duixiang + " !\r\n"
            }
        })
        if ($("#password").val() == "" || $("#password").val() == null || $("#password").val().length < 8) {
            alertShow += $("#password").parent().parent().find('.error-msg').html() + " !\r\n"
        }
        if (checkSex[0].checked == checkSex[1].checked) {
            alertShow = alertShow + "未选择性别 !\r\n"
        }
        if (checkSex[0].checked) {
            sex = checkSex[0].value
        } else {
            sex = checkSex[1].value
        }
        if (!checkSex[2].checked) {
            alertShow = alertShow + "未阅读协议 ！\r\n"
        }
        if (alertShow && alertShow.length > 0) {
            event.preventDefault(); // 拦截form,不执行跳转
            alert(alertShow)
        } else {
            var sendmsg = {
                "username": checkList[0].val(),
                "email": checkList[1].val(),
                "mobile": checkList[2].val(),
                "password": $("#password").val(),
                "sex": sex,
                "createtime": moment().format('YYYY-MM-DD-HH-mm-ss')
            };
            console.log(sendmsg);
            $.ajax({
                type: "post",
                url: "registerhandle",
                async: false,
                method: "post",
                dataType: "text",
                data: sendmsg,
                success: function (e) {
                    alert(e);
                },
            })
            window.location.replace(location.origin + "/user/login")
        }
    })
});