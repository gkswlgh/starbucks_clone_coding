$(function() {
    // 나에게 선물하기
    $("#giftMe").on("change", giftMe);

    //받는 사람 이메일 뒷자리 선택
    $(document).on("change", '[name="em_select3"]', function() {
        $(this).parent().prev().val($(this).val());
    });

    $(document).on("click", "a.addEmail", addEmailArea); // 이메일 입력창 [추가]
    $(document).on("click", "a.removeEmail", removeEmailArea); // 이메일 입력창 [삭제]


    $(".amountInput").on("keyup", changeTotPrice); // 충전금액 입력

    $(".amountInput").on("click", function() {
        $("#price5").prop("checked", true);
    });

    // 충전금액 검사2
    $(".amountInput").on("focusout", function() {
        if (number < 10000) {
            alert("1만원 ~ 50만원까지 가능합니다. (5천원 또는 1만원 단위로만 입력 가능)");
            number = 0;
            $(this).val("");
        }
    });


    // [뒤로]
    $("li.gift_info_send_btn1 > a").on("click", function() {
        var arrKeyAndValues = new Array({
            "KEY": "egiftCartSeq",
            "VALUE": $("#egiftCartSeq").val()
        });

        var strAction = "gift_step1의 뷰페이지url";

        //데이터 유지한채로 뒤로가기(arrKeyAndValues, strAction);
    });

});


/**
 * 나에게 선물하기
 */
function giftMe() {
    var $div = $(".tbl_card_sending").eq(0);

    var userName = "";
    var arrEmail = new Array("", "");

    if ($(this).is(":checked")) {
        userName = $(this).data("username");
        arrEmail = $(this).data("email").split("@");

        while ($(".tbl_card_sending").length > 1) {
            removeEmailArea();
        }

        $("#reqMsg_tr").hide();
    } else {
        $("#reqMsg_tr").show();
    }

    $div.find('[name="name"]').val(userName);
    $div.find('[name="email1"]').val(arrEmail[0]);
    $div.find('[name="email2"]').val(arrEmail[1]);
}

/**
 * 받는사람 이메일 영역 추가
 */
function addEmailArea() {
    var nLength = $(".tbl_card_sending").length;
    if (nLength >= 10) {
        alert("1회 10명까지만 입력 하실 수 있습니다.");
        return;
    }

    var nSeq = nLength + 1;

    var div = '<div class="tbl_card_sending">';
    div += '  <p>' + nSeq + '</p>';
    div += '  <input class="voc_ttl_input1 sender w100" placeholder="받는 사람 이름" type="text" name="name" />';
    div += '  <input class="mail_input em_input" name="email1" title="이메일 앞주소" type="text" />';
    div += '  <p class="mail_at">@</p>';
    div += '  <input class="mail_input em_input" name="email2" title="이메일 뒷주소" type="text" />';
    div += '  <p class="em_sel_wrap mail_sel_wrap">';
    div += '      <label for="em_select3_' + nSeq + '">직접입력</label>';
    div += '      <select id="em_select3_' + nSeq + '" name="em_select3" title="이메일 선택">';
    div += '          <option value="" selected="selected">직접입력</option>';
    div += '          <option value="hotmail.com">hotmail.com</option><option value="yahoo.co.kr">yahoo.co.kr</option><option value="hanmir.com">hanmir.com</option>option value="naver.com">naver.com</option><option value="empal.com">empal.com</option><option value="hitel.net">hitel.net</option><option value="netian.com">netian.com</option><option value="nate.com">nate.com</option><option value="korea.com">korea.com</option><option value="hanmail.net">hanmail.net</option><option value="freechal.com">freechal.com</option><option value="lycos.co.kr">lycos.co.kr</option><option value="gmail.com">gmail.com</option>';
    div += '      </select>';
    div += '  </p>';
    div += '  <a class="sender_addel_btn addEmail" href="javascript:void(0);">추가</a>';
    div += '  <a class="sender_addel_btn removeEmail" href="javascript:void(0);">삭제</a>';
    div += '</div>';

    $("a.addEmail, a.removeEmail").remove();
    $(div).insertBefore(".card_sending >p.gift_info_adding");
}

/**
 * 받는사람 이메일 영역 삭제
 */
function removeEmailArea() {
    var nLength = $(".tbl_card_sending").length;
    if (nLength == 1) {
        alert("1명 이상 입력 하셔야 합니다.");
        return;
    }
    var $div = $(".tbl_card_sending");
    var nTargetIdx = $div.length - 2;

    $div.eq(nTargetIdx).append($("a.addEmail, a.removeEmail"));
    $div.last().remove();
}




// 충전금액 검사
function changeTotPrice() {
    $(this).val($(this).val().replace(/[^0-9]/g, ""));
    number = $(this).val();
    if (number > 500000) {
        alert("1만원 ~ 50만원까지 가능합니다. (5천원 또는 1만원 단위로만 입력 가능)");
        number = 0;
        $(this).val("");
    }
}