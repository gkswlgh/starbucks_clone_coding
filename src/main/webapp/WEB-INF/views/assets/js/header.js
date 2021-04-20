/**
 * header : 메뉴바
 */


$(function() {
	/*변수*/
	//header
	var $gnb = $('.gnb_nav').find('li');
	var $subNav = $('.gnb_nav').find('.gnb_sub_wrap');
	var $btn_search = $("#btn_search_span").parent();


	/*btn_search:click*/
	$("#btn_search_span").click(function() {
			
		if ($btn_search.hasClass("btn_search")) {
			$btn_search.attr("style", "background:#fff; width:180px;");
			$btn_search.find("input").attr("style", "display:inline-block;");
			$(".util_nav").attr("style", "right:232px;");
			
			$btn_search.removeClass("btn_search");
			$btn_search.addClass("btn_search_on");
			
		} else if ($btn_search.hasClass("btn_search_on")) {
			var keyword = $("#totalSearch").val();
		
			if (keyword !="" && keyword !=null) {
				window.location = ROOT_URL + "/search?keyword="+ keyword;
			} else {
				$btn_search.attr("style", "width:32px;");
				$btn_search.find("input").attr("style", "display:none;");
				$(".util_nav").attr("style", "right:93px;");
				
				$btn_search.removeClass("btn_search_on");
				$btn_search.addClass("btn_search");
			}
		}
	});  
	
	/*btn_search:keyup*/
	$("#totalSearch").keyup(function(e) {
        if (e.keyCode == 13) {
        	var keyword = $("#totalSearch").val();
            window.location = ROOT_URL + "/search?keyword="+ keyword;
        }
    });
	
	

	//gnb_subNav
	$gnb.on('mouseover', function(e) {
		$gnb.find("h2>a").removeClass('on');
		$(this).find("h2>a").addClass('on');

		var $thisSubNav = $(this).find('.gnb_sub_wrap');
		$subNav.removeClass('on');
		$thisSubNav.stop().slideDown(200);

	}).on('mouseout', function(e) {
		$gnb.find("h2>a").removeClass('on');

		var $thisSubNav = $(this).find('.gnb_sub_wrap');
		$thisSubNav.stop().slideUp(200);
	});
});