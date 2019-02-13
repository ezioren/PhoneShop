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

    // 邮箱 TODO 邮箱补全
    $('#email').autocomplete({
        autoFocus:true,
        delay:0,
        source:function(request,response){
            var hosts=['qq.com','163.com','gmail.com'];
            var term=request.term;  //获取用户输入内容
            var name=term;  //邮箱的用户名
            var host="";  //邮箱的域名
            var ix=term.indexOf('@');  //@的位置
            var result=[];  //最终呈现的邮箱列表
                  
            //当有@的时候，重新分别用户名
            if(ix>-1){
                name=term.slice(0,ix);
                host=term.slice(ix+1);
            }
                  
             if(name){

                  }
                  response(result);
        },
    })
    $('#email').blur(function () {
        isEmpty($(this))
    })

    // 手机
    // 只能输入数字，非数字自动删除
    $('#phonenum').blur(function () {
        isEmpty($(this))
    }).keyup(function(){
        $(this).val($(this).val().replace( /[^0-9]/g,''));
    }).bind("paste",function(){
        $(this).val($(this).val().replace( /[^0-9]/g,''));
    })

    //密码 TODO 密码复杂度设定
    $('#password').blur(function () {
        isEmpty($(this))
    })
    // 验证密码前后一致
    $('#surePassword').blur(function () {
        if($(this).val()!=$('#password').val()){
            $(this).parent().parent().find('.error-msg').show()
        }else {
            $(this).parent().parent().find('.error-msg').hide()
        }
    })

    // 限制性别选择
    function isSex(target){
        if (target.prop("checked")) {
            target.siblings().prop("disabled", "true")
        }else {
            target.siblings().prop("disabled", "")
        }
    }

    // 性别
    $('#checkbox-man').click(function () {
        isSex($(this))
    })
    $('#checkbox-woman').click(function () {
        isSex($(this))
    })

    // 提交前检查是否有空
    function checkIsEmpty(target){
        var duixiang = target.parent().parent().find('.error-msg')
        if (target.val()=="" || target.val()==null){
            // event.preventDefault() // 拦截form,不执行跳转
            return duixiang.html()
        }
    }

   $('form').submit(function () {
       var alertShow = ""
       var checkList = [$('#username'), $('#email'), $('#phonenum'), $('#password')]
       var checkSex = $('input[type="checkbox"]')
       $.each(checkList, function (i) {
           var duixiang = checkIsEmpty(checkList[i])
           if (duixiang) {
               alertShow += duixiang + " !\r\n"
           }
       })
       if (checkSex[0].checked==checkSex[1].checked){
           alertShow = alertShow + "未选择性别 !\r\n"
       }
       if (!checkSex[2].checked){
           alertShow = alertShow + "未阅读协议 ！\r\n"
       }
       if (alertShow && alertShow.length>0){
           event.preventDefault() // 拦截form,不执行跳转
           alert(alertShow)
       }
       else{
           var sendmsg =
               {
                   "username": checkList[0].val(),
                   "email": checkList[1].val(),
                   "phonenum": checkList[2].val(),
                   "password": checkList[3].val(),
                   "sex": function () {
                       if (checkSex[0].checked) {
                           return checkSex[0].value
                       }else {
                           return checkSex[1].value
                       }
                   }
               }
           $.post("registerhandle", sendmsg, function (data) {
           })
       }

   })


})