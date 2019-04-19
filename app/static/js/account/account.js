$(function () {
    // function getchange(source){
    //     var context = new Array(20)
    //     $.each(source.find('li').eq(0).find('input'), function (i,val) {
    //         console.log($(this).html())
    //         context.push($(this).html());
    //     })
    //     return context
    // }

    $('#save_change').click(function () {
        $('#changeshow li').eq(0).find('input').val()
        console.log($('#changeshow li').eq(0).find('input').val())

    })
})