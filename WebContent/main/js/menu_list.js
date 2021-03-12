$(function() {

    $("div.product_list > dl > dd > ul > li").bind("click", function() {
        goUrl = $(this).find("a").attr("href");
        location.href = goUrl;
    });

    // 음료 - 분류보기 - 사진으로 보기 & 영양정보로 보기
    $("dl.product_view_tab > dt > a:not(.selected)").parent().next().hide();
    $("dl.product_view_tab > dt > a").bind("click", function() {

        if ($(this).hasClass('a2')) {
            $('#mn_select_wrap').hide();
        } else {
            $('#mn_select_wrap').show();
        }

        $("dl.product_view_tab > dt > a").removeClass("selected");
        $(this).addClass("selected");
        $("dl.product_view_tab > dd").hide();
        $(this).parent().next().show();
        return false;
    });


    // 카테고리 상세보기 전체선택 버튼
    $(document).on("change", "#product_all", function() {

        if ($(this).prop('checked')) {
            $("div.menu_btns > ul > li > label > a").addClass("on");
        } else {
            $("div.menu_btns > ul > li > label > a").removeClass("on");
        }
        return false;
    });


    // 카테고리 상세보기 선택 버튼
    $(document).on("change", "div.menu_btns > ul > li > input", function() {

        if ($(this).next().children().hasClass('on')) {
            $(this).next().children().removeClass("on");
            // 상품분류 선택하면 리스트 아래에 변화가 바로 표시되도록 (ajax?)
        } else {
            $(this).next().children().addClass("on");
            // 상품분류 선택하면 리스트 아래에 변화가 바로 표시되도록
        }
        return false;
    });
});