$(function() {
    //나와 어울리는 커피 찾기 질문 넘기기
    $("ul.find_taste01 li dl").animate({ 'opacity': 1, 'top': 0 }, 500);

    $("ul.find_taste01 a").bind("click", function() {
        $("div.find_section1").stop().animate({ 'top': -700 }, 500);
        $("div.find_section2").stop().animate({ 'top': 0 }, 500);
        $("div.find_section3").stop().animate({ 'top': 700 }, 500);
        $("ul.find_taste02 li > dl").stop().animate({ 'top': 0 }, 500);
    });

    $("ul.find_taste02 a").bind("click", function() {
        $("div.find_section1").stop().animate({ 'top': -1400 }, 500);
        $("div.find_section2").stop().animate({ 'top': -700 }, 500);
        $("div.find_section3").stop().animate({ 'top': 0 }, 500);
        $("ul.find_taste03 li > dl").stop().animate({ 'top': 0 }, 500);
    });


});