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
                        <li><a href="${pageContext.request.contextPath}/mypage"><span class="en">My Starbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/my_menu"><span class="en">My 메뉴</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <!-- 최근 마신 음료 안내 -->
                <section class="my_drinkShop_wrap" style="height: 300px; margin-left:-60px;">
                    <p class="drinkShop_recent" style="display:block;font-size:18px;height:50px;line-height:50px;vertical-align:top;">
                        <strong class="t_0d5f34">자주 주문하는 메뉴 |</strong>
                    </p>
                    <!-- 그래프를 표시할 위치 -->
					<div style="width: 920px; height: 500px; margin-right:-10px;position:relative;">
						<canvas id="myChart"></canvas>
						<c:if test="${nameStr == null || sumOrderStr == null}"><div class="t_0d5f34" style="position:absolute;top:230px;left:370px;">아직 주문한 메뉴가 없습니다.</div></c:if>
					</div>
                </section>
                <!-- 최근 마신 음료 안내 끝 -->
                <!-- 음료/매장 info -->
                <section class="my_drinkShop_info">
                    <div class="drinkShop_info">
                        <dl class="content_tabmenu mcontent_tabmenu">
                            <dt class="stab stab_01">
                                <h5>
                                    <a style="font-size:14px;">자주 주문하는 메뉴</a>
                                </h5>
                            </dt>
                            <dd class="panel content_panel">
                                <p class="tip03">
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
                <!-- 자주 주문하는 메뉴 순위 시작 -->
                                    <c:choose>
								        <c:when test="${oftList != null && fn:length(oftList) > 0}">
								        	<c:forEach var="item" items="${oftList}" varStatus="status">
                                        <tr>
                                            <td>
                                            <c:if test="${status.index < 1}"><img src="//image.istarbucks.co.kr/common/img/util/reward/icon_drinkShop_01.png" alt="1위"></c:if>
                                            <c:if test="${status.index >= 1}">${status.index + 1}위</c:if>
                                            </td>
                                            <td>
                                                <a  style="font-size:14px;" href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="btn_show_pop_detail" data-favoriteno="${item.menu_id}">${item.name}</a>
                                                <!-- <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="myFavorite" data-favoriteno="${item.menu_id}">
                                                    <img src="//image.istarbucks.co.kr/common/img/store/icon_fav_on.png" alt>
                                                </a> -->
                                            </td>
                                            <td>
                                                <span class="n1">${item.sum_order}</span>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </c:when>
								        <c:otherwise> 
								        <tr>
                                            <td colspan="4">
                                            	아직 주문한 메뉴가 없습니다. <a href="${pageContext.request.contextPath}/product/menu_list" class="c063">(메뉴 주문하러 가기)</a>
                                            </td>
                                        </tr>
								        </c:otherwise>
								    </c:choose>
                <!-- 자주 주문하는 메뉴 순위 끝 -->
                                    </tbody>
                                </table>
                            </dd>
                            <dt class="stab on stab_02">
                                <h5>
                                    <a style="font-size:14px;">좋아하는 메뉴</a>
                                </h5>
                            </dt>
                            <dd class="panel on content_panel">
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
                <!-- 좋아하는 메뉴 시작 -->
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
                                                <a  style="font-size:14px;" href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="btn_show_pop_detail" data-favoriteno="${item.like_id}">${item.menu_name}</a>
                                                <!-- <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="myFavorite" data-favoriteno="${item.like_id}">
                                                    <img src="//image.istarbucks.co.kr/common/img/store/icon_fav_on.png" alt>
                                                </a> -->
                                            </td>
                                            <td>${item.reg_date}</td>
                                        </tr>
								            </c:forEach>
							        	</c:when>
								        <c:otherwise> 
								        <tr>
                                            <td colspan="4">
                                            	아직 좋아하는 메뉴로 등록된 음료가 없습니다. <a href="${pageContext.request.contextPath}/product/menu_list" class="c063">(메뉴 등록하러 가기)</a>
                                            </td>
                                        </tr>
								        </c:otherwise>
								    </c:choose>
                <!-- 좋아하는 메뉴 끝 -->
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
                <!-- 페이지 번호 구현 -->
                <div class="egiftCard_tbl_pagination">
				<ul class="pager">
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/my/my_menu" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
						</c:url>
						<li class="active"><a href="${prevPageUrl}">이전 &nbsp;|&nbsp;</a></li>
					</c:when>
					<c:otherwise>
			    		<li class="active">이전 &nbsp;|&nbsp;</li>
			    	</c:otherwise>
				</c:choose>
			
				<%-- 페이지 번호 (그룹 시작페이지 ~ 끝페이지 를 반복) --%>
				<c:forEach var="i" begin="${pageData.startPage}"
					end="${pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/my/my_menu" var="pageUrl">
						<c:param name="page" value="${i}" />
					</c:url>
			
					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${pageData.nowPage == i}">
							<li class="active">${i}</li>
						</c:when>
						<%-- 나머지 페이지의 경우 링크 적용함 --%>
						<c:otherwise>
							<li class="active"><a href="${pageUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<%-- 다음 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.nextPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/my/my_menu" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
						</c:url>
						<li class="active"><a href="${nextPageUrl}">&nbsp;| &nbsp;다음</a></li>
					</c:when>
					<c:otherwise>
			    		<li class="active">&nbsp;| &nbsp;다음</li>
			    	</c:otherwise>
				</c:choose>
				</ul>
				</div>
                <!-- 페이지번호구현 끝 -->
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
	<!-- chartjs cdn 참조 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<!-- 데이터 시각화 구현 -->
	<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: [${nameStr}],			//각각의 bar에 표시할 x축 텍스트들 (메뉴이름)
	        datasets: [{
	            label: '주문 횟수',				//범주
	            data: [${sumOrderStr}],			//각 bar에 대한 y축 좌표 데이터
	            backgroundColor:
	                'rgba(0, 120, 60, 0.2)'
	           ,
	            borderColor: 
	                'rgba(0, 120, 60, 1)'
	            ,
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	</script>
	<!-- 사용자 정의 스크립트 -->
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