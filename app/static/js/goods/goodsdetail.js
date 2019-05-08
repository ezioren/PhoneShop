$(function () {
    var cnt_max = $('#goods-num-max').attr('data-max');

    $("#goods-num-btn-left").click(function () {
        var input_value = $(".goods-num-area").val();
        $(".goods-num-area").val(--input_value);
        validateCnt();
    });

    $("#goods-num-btn-right").click(function () {
        var input_value = $(".goods-num-area").val();
        $(".goods-num-area").val(++input_value);
        validateCnt();
    });


    $(".goods-num-area").blur(function () {
        validateCnt();
    });

    $(".goods-num-area").keyup(function () {
        var input_value = $(".goods-num-area").val();
        if (input_value.length > 2) {
            validateCnt();
        }
    });

    function isSelet(target) {
        if (target.prop("checked")) {
            target.siblings().prop("disabled", "true");
        } else {
            target.siblings().prop("disabled", "");
        }
    }

    $('.select-color').click(function () {
        isSelet($(this))
    })

    $('.select-version').click(function () {
        isSelet($(this))
    })

    /*数字验证*/
    function validateCnt() {
        var input_value = $(".goods-num-area").val();
        if (isNaN(input_value)) {
            $(".goods-num-area").val(1);
            $("#goods-num-btn-left").addClass("shoes-cnt-minus-blur");

        } else {
            if (input_value >= cnt_max) {
                $(".goods-num-area").val(cnt_max);
                $("#goods-num-btn-left").removeClass("shoes-cnt-minus-blur");
                $("#goods-num-btn-right").addClass("shoes-cnt-plus-blur");
            }

            if (input_value <= 1) {
                $(".goods-num-area").val(1);

                $("#goods-num-btn-left").addClass("shoes-cnt-minus-blur");
            }

            if (input_value > 1 && input_value < cnt_max) {
                $("#goods-num-btn-left").removeClass("shoes-cnt-minus-blur");
                $("#goods-num-btn-right").removeClass("shoes-cnt-plus-blur");
            }
        }
    }

    $('#input-content-grade').blur(function () {
        if (isNaN($(this).val())) {
            $(this).val(5);
        }else if ($(this).val()>5){
            $(this).val(5);
        }else if ($(this).val()<0){
            $(this).val(1);
        }
    })
})