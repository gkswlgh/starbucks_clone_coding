<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <div id="container">
        <!-- 서브타이틀 -->
        <header class="sub_tit_wrap">
            <div class="sub_tit_bg">
                <div class="sub_tit_inner">
                    <h4>
                        <img src="//image.istarbucks.co.kr/common/img/util/reward/my_menu.png" alt="My 메뉴" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks"><span class="en">My Starbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks/my_menu"><span class="en">My 메뉴</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <!-- 최근 마신 음료 안내 -->
                <section class="my_drinkShop_wrap">
                    <p class="drinkShop_recent">
                        <strong>${member.user_name}</strong>
                        님은 가장 최근 2021년 2월 10일에
                        <strong class="t_0d5f34">(V)차이 티 라떼</strong>
                        를 마셨습니다.
                    </p>
                </section>
                <!-- 최근 마신 음료 안내 끝 -->
                <!-- 음료/매장 info -->
                <section class="my_drinkShop_info">
                    <div class="drinkShop_info">
                        <dl class="content_tabmenu mcontent_tabmenu">
                            <dt class="stab stab_01 on">
                                <h5>
                                    <a>자주 주문하는 메뉴 통계</a>
                                </h5>
                            </dt>
                            <dd class="panel on content_panel">
                                <p class="tip03">
                                    <span>최근 3개월 기준 자료입니다. <br>매일 자정 갱신됩니다.</span>
                                </p>
                                <table class="drinkShop_area_info_tbl" summary="My 메뉴 순위, 메뉴명, 주문횟수에 대한 테이블">
                                    <caption>My 메뉴 순위, 메뉴명, 주문횟수에 대한 테이블</caption>
                                    <colgroup>
                                        <col width="60">
                                        <col width="550">
                                        <col width="220">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">순위</th>
                                            <th scope="col">메뉴명</th>
                                            <th scope="col">주문횟수</th>
                                        </tr>
                                    </thead>
                                    <tbody id="MyStoreRanking">
                                        <tr>
                                            <td>
                                                <img src="//image.istarbucks.co.kr/common/img/util/reward/icon_drinkShop_01.png" alt="1위">
                                            </td>
                                            <td>
                                                <a herf="#" class="btn_show_pop_detail" data-favoriteno="내메뉴번호">차이 티 라떼</a>
                                                <a href="${pageContext.request.contextPath}/" class="myFavorite" data-favoriteno="내메뉴번호" data-myfavoriteyn="Y">
                                                    <img src="//image.istarbucks.co.kr/common/img/store/icon_fav_on.png" alt>
                                                </a>
                                            </td>
                                            <td>
                                                <span class="n1">2</span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </dd>
                            <dt class="stab stab_02">
                                <h5>
                                    <a>좋아하는 메뉴</a>
                                </h5>
                            </dt>
                            <dd class="panel content_panel">
                                <p class="tip03">
                                </p>
                                <table class="drinkShop_area_info_tbl" summary="My 메뉴 no, 메뉴명, 등록일에 대한 테이블">
                                    <caption>My 메뉴 no, 메뉴명, 등록일에 대한 테이블</caption>
                                    <colgroup>
                                        <col width="60">
                                        <col width="60">
                                        <col width="490">
                                        <col width="220">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">
                                                <div class="ez-checkbox">
                                                    <input type="checkbox" id="drinkShop_view_ck_all" name="drinkShop_view_ck_all" class="chkAll ez-hide" title="전체 선택">
                                                </div>
                                            </th>
                                            <th scope="col" class="en">No</th>
                                            <th scope="col">메뉴명</th>
                                            <th scope="col">등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
								        <c:when test="${menuList != null && fn:length(menuList) > 0}">
								        	<c:forEach var="item" items="${menuList}" varStatus="status">
                                        <tr>
                                            <td>
                                                <div class="ez-checkbox">
                                                    <input type="checkbox" name="drinkShop_view_ck" value="${item.like_id}" class="ez-hide" title="선택">
                                                </div>
                                            </td>
                                            <td>
                                                <span class="n1">${status.index+1}</span>
                                            </td>
                                            <td>
                                                <a herf="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="btn_show_pop_detail" data-favoriteno="${item.like_id}">${item.menu_name}</a>
                                                <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="myFavorite" data-favoriteno="${item.like_id}">
                                                    <img src="//image.istarbucks.co.kr/common/img/store/icon_fav_on.png" alt>
                                                </a>
                                            </td>
                                            <td>${item.reg_date}</td>
                                        </tr>
								            </c:forEach>
							        	</c:when>
								        <c:otherwise> 
								        <tr>
                                            <td colspan="4">
                                            	아직 좋아하는 메뉴로 등록된 메뉴가 없습니다. <a href="${pageContext.request.contextPath}/product/menu_list" class="c063">(메뉴 등록하러 가기)</a>
                                            </td>
                                        </tr>
								        </c:otherwise>
								    </c:choose>
                                    </tbody>
                                </table>
                                <!-- 버튼 -->
                                <div class="drinkShop_btnZone clear">
                                    <ul>
                                        <li>
                                            <a id="btn_selected_del" class="btn_selected_del">선택삭제</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- 버튼 끝 -->
                                <!-- 페이징 -->
                                <div class="drinkShop_tbl_pagination">
                                    <ul class="pager">
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/">1</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- 페이징 끝 -->
                            </dd>
                        </dl>
                    </div>
                </section>
                <!-- 음료/매장 info 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {
    	
    	//탭전환
        $("dl.content_tabmenu dt.stab").on("click", function() {
            var now_Idx = $("dl.content_tabmenu dt.stab").index(this);

            $("dl.content_tabmenu dt.stab").removeClass("on").eq(now_Idx).addClass("on");
            $("dl.content_tabmenu").find("dd").hide().eq(now_Idx).show();
        });//탭전환끝
        

    	//좋아하는메뉴 전체선택
        $("#drinkShop_view_ck_all").change(function() {

            if ($(this).prop('checked')) {
            	$('[name="drinkShop_view_ck"]').prop('checked', true);
            } else {
            	$('[name="drinkShop_view_ck"]').prop('checked', false);
            }
        });//좋아하는메뉴 전체선택끝
    	
        
    	//좋아하는메뉴 선택삭제
        $("#btn_selected_del").on("click", function() {
        	var input = '';
        	
        	//체크박스 받아서 반복문
            $('input[name=drinkShop_view_ck]:checked').each(function(index){ 
            	if (index != 0) {
            		input += ',';
            	}
            	
            	input += $(this).val();
            });

            $.post(ROOT_URL + '/rest/my/del_like_menu', {
                like_id_list: input
            }, function(json) {
            	if (json.rt == "OK") {
            		alert('성공적으로 삭제되었습니다.');
            		location.reload();
            	}
            });
        });//좋아하는메뉴 선택삭제끝

    })
    </script>
</body>

</html>