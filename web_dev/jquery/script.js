$(function(){
    $("#poem").hover(function(){
        $("#beard").animate({
            left: '700px'
        }, slow);
    });
});

$(function(){
    $("#poem").mouseout(function(){
        $("#poem").fadeOut("9000");
    });
});

$(function(){
    $("#hint").mouseenter(function(){
        $("#poem").fadeIn("7000");
    });
});
