$(document).ready(function(){
    'use strict';
    var c, currentScrollTop = 0,
        header = $('header');
    
    $(window).scroll(function(){
        var a = $(window).scrollTop();
        var b = header.height();

        currentScrollTop = a;

        if(c < currentScrollTop && a > b + b){
            header.addClass("scrollUp");
        }else if(c > currentScrollTop && !(a <= b)){
            header.removeClass("scrollUp");
        }
        c = currentScrollTop;
    })
})