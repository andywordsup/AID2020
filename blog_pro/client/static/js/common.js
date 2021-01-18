$(document).ready(function () {
    //檢測ie 6789
    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
        window.scrollReveal = new scrollReveal({
            reset: true
        });
    }
    // 弹窗回復評論
    var list = document.getElementsByClassName('replyComment');
    for (var i of list) {
        i.addEventListener("click", function (ev) {
            ev.preventDefault();
            var txt=  "請輸入回覆：";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.input,{
                onOk:function(reply){
                    console.log(reply);
                }
            });
        }, false);
    }

    /*nav show or hide*/
    $('.nav>li').hover(function () {
        $(this).children('ul').stop(true, true).show(400);
    }, function () {
        $(this).children('ul').stop(true, true).hide(400);
    });
    /*search*/
    $('.search_ico').click(function () {
        $('.search_bar').toggleClass('search_open');
        if ($('#keyboard').val().length > 2) {
            $('#keyboard').val('');
            $('#searchform').submit();
        } else {
            return false;
        }
    });
    /*banner*/
    $('#banner').easyFader();

    /*topnav select*/
    var obj = null;
    var allMenu = document.getElementById('topnav').getElementsByTagName('a');
    // console.log(allMenu);
    obj = allMenu[0];
    for (i = 1; i < allMenu.length; i++) {
        if (window.location.href.indexOf(allMenu[i].href) >= 0) {
            obj = allMenu[i];
        }
    }
    obj.id = 'topnav_current';

    /*mnav dl open*/
    var oH2 = document.getElementsByTagName('h2')[0];
    var oUl = document.getElementsByTagName('dl')[0];
    oH2.onclick = function () {
        var style = oUl.style;
        style.display = style.display == 'block' ? 'none' : 'block';
        oH2.className = style.display == 'block' ? 'open' : '';
    };
    //點擊效果
    $('.list_dt').on('click', function () {
        $('.list_dd').stop();
        $(this).siblings('dt').removeAttr('id');
        if ($(this).attr('id') == 'open') {
            $(this).removeAttr('id').siblings('dd').slideUp();
        } else {
            $(this).attr('id', 'open').next().slideDown().siblings('dd').slideUp();
        }
    });

    //設置固定關注

    if ($('#follow-us')) {
        var followUsPosition = $('#follow-us').offset().top;
        window.onscroll = function () {
            var nowPosition = document.documentElement.scrollTop;
            if (nowPosition - followUsPosition > 0) {
                setTimeout(function () {
                    $('#follow-us').attr('class', 'guanzhu gd');
                }, 150);
            } else {
                $('#follow-us').attr('class', 'guanzhu');
            }
        };
    }


    //回到頂部
    // browser window scroll (in pixels) after which the "back to top" link is shown
    var offset = 300,
        //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
        offset_opacity = 1200,
        //duration of the top scrolling animation (in ms)
        scroll_top_duration = 700,
        //grab the "back to top" link
        $back_to_top = $('.cd-top');

    //hide or show the "back to top" link
    $(window).scroll(function () {
        ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible'): $back_to_top.removeClass('cd-is-visible cd-fade-out');
        if ($(this).scrollTop() > offset_opacity) {
            $back_to_top.addClass('cd-fade-out');
        }
    });
    //smooth scroll to top
    $back_to_top.on('click', function (event) {
        event.preventDefault();
        $('body,html').animate({
            scrollTop: 0,
        }, scroll_top_duration);
    });

});


function makeHeader(blog_username, username){
    //blog_username 当前访问的博客的作者
    //username   登陆的用户

    //博客作者-用户信息url
    var user_info_url = '/' + blog_username + '/' + 'info'
    //登陸用戶發博客url
    if (username){
        var topic_release_url = '/' + username + '/' + 'topic/release'
    }else{
        //沒有登陸狀態直接去登陸
        var topic_release_url = '/login'
    }

    //訪問博主的博客文章
    var user_topics_url = '/' + blog_username + '/' + 'topics'

    var header_body = ''
    header_body += '<header id="header">';
    header_body += '<div class="menu">';
    header_body += ' <nav class="nav" id="topnav"> ';
    header_body += '<h1 class="logo"><a href="/index"> ' + blog_username + '的博客</a></h1>';
    header_body += '<li><a href="/index">首頁</a></li>';
    header_body += '<li>';
    header_body += '<a href=' + '"' + user_topics_url + '"' + '>博客群文章列表</a>';
    header_body += '<ul class="sub-nav">';
    header_body += '<li><a href=' + '"' + user_topics_url + '?category=tec"' + '>技術</a></li>';
    header_body += '<li><a href=' + '"' + user_topics_url + '?category=no-tec"' + '>非技術</a></li>';
    header_body += '</ul>';
    header_body += '</li>';
    header_body += '<li><a href=' + '"' + user_info_url + '"' + '>個人設定</a> </li>';
    header_body += '<li><a href=' + '"' + topic_release_url + '"' + '>發表博客</a> </li>';
    header_body += '</nav>';
    header_body += '</div>';
    if (username){
        header_body += '<li><a href= /' + username + '/change_info id="change_info" target="_blank">编辑</a></li>';
        //header_body += '<li><a href="/" id="login_out" target="_blank">登出</a></li>';
        header_body += '<li><span id="login_out" target="_blank">登出</span></li>';
    }else{
        header_body += '<a href="/login" id="login" target="_blank">登入</a>';
        header_body += '<a href="/register" id="register" target="_blank">註冊</a>';
    }
    header_body += '</header>';

    return header_body
}


function loginOut(){

    $('#login_out').on('click', function(){

            if(confirm("確定登出嘛？")){
                window.localStorage.removeItem('dnblog_token');
                window.localStorage.removeItem('dnblog_user');
                window.location.href= '/index';
            }
        }
    )

}

function Header(username){
    //blog_username 當前訪問的博客的作者
    //username   登陸的用戶
      console.log('token have')
    blog_username=username
    //登陸用戶發博客url
    if (username){
        var topic_release_url = '/' + username + '/' + 'topic/release'
        var user_topics_url = '/' + blog_username + '/' + 'topics'
        var user_info_url = '/' + blog_username + '/' + 'info'
    }else{
        //沒有登陸狀態直接去登陸
        var topic_release_url = '/login'
        var user_topics_url = '/login'
        var user_info_url = '/login'

    }

    //訪問博主的博客文章
     //登陸用戶發博客url
     //訪問博主的博客文章
    var header_body = ''
    header_body += '<header id="header">';
    header_body += '<div class="menu">';
    header_body += ' <nav class="nav" id="topnav"> ';
    if(username){
        header_body += '<h1 class="logo"><a href="/index"> ' + username + '的博客</a></h1>';
    }else{
        header_body += '<h1 class="logo"><a href="/index"> 個人的博客</a></h1>';}
    header_body += '<li><a href="/index">網站首页</a></li>';
    header_body += '<li>';
    header_body += '<a href=' + '"' + user_topics_url + '"' + '>博客群文章列表</a>';
    header_body += '<ul class="sub-nav">';
    header_body += '<li><a href=' + '"' + user_topics_url + '?category=tec"' + '>技術</a></li>';
    header_body += '<li><a href=' + '"' + user_topics_url + '?category=no-tec"' + '>非技術</a></li>';
    header_body += '</ul>';
    header_body += '</li>';;
    header_body += '<li><a href=' + '"' + user_info_url + '"' + '>個人設定</a> </li>';
    header_body += '<li><a href=' + '"' + topic_release_url + '"' + '>發表博客</a> </li>';
    header_body += '</nav>';
    header_body += '</div>';
    if (username){
        header_body += '<li><a href= /' + username + '/change_info id="change_info" target="_blank">编辑</a></li>';
        //header_body += '<li><a href="/" id="login_out" target="_blank">登出</a></li>';
        header_body += '<li><span id="login_out" target="_blank">登出</span></li>';
    }else{
        header_body += '<a href="/login" id="login" target="_blank">登入</a>';
        header_body += '<a href="/register" id="register" target="_blank">註冊</a>';
    }

    header_body += '</header>';
    header_body+='<article>';
    header_body+='<div class="picsbox">';
    header_body+='<div class="banner">';
    header_body+='<div id="banner" class="fader">';
    header_body+='<li class="slide"><a href="http://18.191.69.168/superuser/topics/detail/22" target="_blank"><img src="static/images/shut.jpg">';
    header_body+='<span class="imginfo">跟上時代，現代人需要學Python的五大理由!</span>';
    header_body+='</a></li>';
    header_body+='<li class="slide"><a href="http://18.191.69.168/superuser/topics/detail/24" target="_blank"><img src="static/images/banner02.jpg"><span class="imginfo">利用手機隨時隨地編寫python代碼</span></a></li>'
    header_body+='<li class="slide"><a href="http://18.191.69.168/superuser/topics/detail/23" target="_blank"><img src="static/images/wwqq.png"><span class="imginfo">python-win10下使用方式學習</span></a></li>'
    header_body+='<div class="fader_controls">';
    header_body+='<div class="page prev" data-target="prev">&lsaquo;</div>';
    header_body+='<div class="page next" data-target="next">&rsaquo;</div>';
    header_body+='<ul class="pager_list">';
    header_body+='</ul></div></div></div>';
    header_body+='';
    header_body+='<div class="toppic">';
    header_body+='<li> <a href="http://18.191.69.168/superuser/topics/detail/25" target="_blank"> <i><img src="static/images/igi.jpg"></i>';
    header_body+='<h2>python到底可以做什麼呢？</h2><span>Linux</span></a> </li>';
    header_body+='<li> <a href="http://18.191.69.168/superuser/topics/detail/26" target="_blank"> <i><img src="static/images/zcz.png"></i>';
    header_body+='<h2>Python安裝pip及pip版本管理終極教程</h2><span>python</span></a></li>';
    header_body+='</div></div>';
    header_body+='<div class="blank"></div>';
    header_body+='<div class="blogsbox">';
    header_body+='<div class="blogs" data-scroll-reveal="enter bottom over 1s">';
    header_body+='<h3 class="blogtitle"><a href="http://18.191.69.168/superuser/topics/detail/19" target="_blank">Python語言在人工智能（AI）中的優勢</a></h3>';
    header_body+='<span class="blogpic"><a href="http://18.191.69.168/superuser/topics/detail/19"><img src="static/images/ttkk.jpg" alt=""></a></span>';
    header_body+='<p class="blogtext">本文探討了Python语言在AI领域的優勢與應用。 誰會成為AI 和大數據時代的第一開發語言? 這本已是一个不需要爭論的问题。</p>';
    header_body+='<div class="bloginfo">';
    header_body+='<ul>';
    header_body+='<li class="author"><a></a></li>';
    header_body+='<li class="lmname"><a>學無止境</a></li>';
    // header_body+='<li class="timer">2018-5-13</li>';
    // header_body+='<li class="view"><span>34567</span>已閱讀</li>';
    // header_body+='<li class="like">9999</li>';
    header_body+='</ul></div></div>';
    header_body+='<div class="blogs" data-scroll-reveal="enter bottom over 1s">';
    header_body+='<h3 class="blogtitle"><a href="http://18.191.69.168/superuser/topics/detail/27" target="_blank">python中打開TXT文件報錯</a></h3>';
    header_body+=' <p class="blogtext">信現在很多文件使用txt（文本文件）存儲信息比較方法。但是Python如何打開txt而不會報錯，是一件頭疼的事情...</p>';
    header_body+='<div class="bloginfo">';
    // header_body+='<ul><li class="author"><a href="info.html">皮皮璐</a></li>';
    header_body+='<li class="lmname"><a>學無止境</a></li>';
    // header_body+='<li class="timer">2018-5-13</li>';
    // header_body+='<li class="view">4567已阅读</li>';
    // header_body+='<li class="like">9999</li>';
    header_body+='</ul></div></div>';
    header_body+='<div class="blogs" data-scroll-reveal="enter bottom over 1s">';
    header_body+='<h3 class="blogtitle"><a target="_blank">精通Python编程——Python深入浅出教程</a></h3>';
    header_body+='<span class="bplist">';
    header_body+='<li><a href="http://18.191.69.168/superuser/topics/detail/28"><img src="static/images/avatar.jpg" alt=""></a></li>';
    header_body+='<li><a href="http://18.191.69.168/superuser/topics/detail/29"><img src="static/images/toppic02.jpg" alt=""></a></li>';
    header_body+='<li><a href="http://18.191.69.168/superuser/topics/detail/30"><img src="static/images/banner01.jpg" alt=""></a></li>';
    header_body+='</a></span>';
    header_body+='<p class="blogtext">Python 安装配置及基本语法篇 Python 语言速成 Python 基本知识 Python 常用表达式 Python 基础语法 ... </p>';
    header_body+='<div class="bloginfo">';
    // header_body+='<ul><li class="author"><a href="info.html">皮皮璐</a></li>';
    header_body+='<li class="lmname"><a>學無止境</a></li>';
    // header_body+='<li class="timer">2018-5-13</li>';
    // header_body+='<li class="view"><span>34567</span>已阅读</li>';
    // header_body+='<li class="like">9999</li>';
    header_body+='</ul></div></div>';
   header_body+='<div class="blogs" data-scroll-reveal="enter bottom over 1s">';
    header_body+='<h3 class="blogtitle"><a href="http://18.191.69.168/superuser/topics/detail/31" target="_blank">面向對象六原則</a></h3>';
    header_body+='<span class="blogpic"><a href="http://18.191.69.168/superuser/topics/detail/31"><img src="static/images/wcw.jpg" alt=""></a></span>';
    header_body+='<p class="blogtext">本文探討了Python语言面向對象六原則</p>';
    header_body+='<div class="bloginfo">';
    header_body+='<ul>';
    header_body+='<li class="author"><a></a></li>';
    header_body+='<li class="lmname"><a>學無止境</a></li>';
    // header_body+='<li class="timer">2018-5-13</li>';
    // header_body+='<li class="view"><span>34567</span>已閱讀</li>';
    // header_body+='<li class="like">9999</li>';
    header_body+='</ul></div></div>';
    header_body+='';
    header_body+='';
    header_body+='</div>';
    header_body+='';
    header_body+='</article>';

    return header_body
}


