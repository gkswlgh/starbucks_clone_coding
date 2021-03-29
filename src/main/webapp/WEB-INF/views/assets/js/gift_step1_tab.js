$(function() {
    $("div.gift_card_tabs_wrap a.tab").on("click", function() {
        var now_Idx = $("div.gift_card_tabs_wrap a.tab").index(this);

        $("div.gift_card_tabs_wrap a.tab").removeClass("on").eq(now_Idx).addClass("on");
        $("div.gift_card_tabs_wrap").find("article").hide().eq(now_Idx).show();
    });

    $(document).on("click", ".goStep2", goStep2);

});

function goStep2() {
    var egiftImgMngSeq = $(this).data("egiftimgmngseq");
    var cardImgUrl = $(this).data("cardimgurl");
    var cardName = $(this).data("cardname");

    var arrKeyAndValues = new Array({ "KEY": "egiftImgMngSeq", "VALUE": egiftImgMngSeq }, { "KEY": "cardImgUrl", "VALUE": cardImgUrl }, { "KEY": "cardName", "VALUE": cardName });

    var strAction = "gift_step2의 view페이지의 url";

    // 다음페이지로 파라미터로 (arrKeyAndValues, strAction) 전달
}