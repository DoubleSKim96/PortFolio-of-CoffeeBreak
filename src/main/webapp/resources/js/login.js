// 회원 로그인 탭
$(document).ready(function() {
    $("a[href='#member']").click(function(){
        $("div[class='login-tab5'] ul li:nth-child(1)").attr({
            'class' : 'active'
        });
        $("div[class='login-tab5'] ul li:nth-child(2)").attr({
            'class' : ''
        });
        $("#member").attr({
            'class' : 'login-content active'
        });
        $("#guest").attr({
            'class' : 'login-content'
        });
    });
});

// 비회원 주문 탭
$(document).ready(function() {
    $("a[href='#guest']").click(function(){
        $("div[class='login-tab5'] ul li:nth-child(2)").attr({
            'class' : 'active'
        });
        $("div[class='login-tab5'] ul li:nth-child(1)").attr({
            'class' : ''
        });
        $("#guest").attr({
            'class' : 'login-content active'
        });
        $("#member").attr({
            'class' : 'login-content'
        });
    });
});

