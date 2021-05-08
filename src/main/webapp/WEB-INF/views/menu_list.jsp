<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <div id="container">
        <div class="wrapper">
            <div class="inner p0">
                <!-- 서브타이틀 -->
                <header class="sub_tit_wrap sub_tit_wrap_short2">
                    <div class="sub_tit_bg_white2">
                        <div class="sub_tit_inner_short2">
                            <h2>
                                <img src="//image.istarbucks.co.kr/common/img/menu/menu_tit1.jpg" alt="음료" />
                            </h2>
                            <ul class="smap">
                                <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/product/menu_list"><span class="en c222">MENU</span></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/product/menu_list"><span class="en c222">음료</span></a></li>
                            </ul>
                        </div>
                    </div>
                </header>
                <!-- 서브타이틀 끝 -->
                <!-- 내용 -->
                <!-- 메뉴분류 선택 -->
                <div class="inner p20">
                    <fieldset>
                        <legend class="hid">분류 보기</legend>
                        <div class="menu_input_wrap">
                            <div class="clear">
                                <strong>분류보기</strong>
                                <div class="check_all product_all">
                                    <input id="product_all" name="product_all" type="checkbox" checked/> <label for="product_all">전체 선택</label>
                                </div>
                            </div>
                            <div class="menu_btns">
                                <ul>
                                    <li class="total_search_btn1"><input type="checkbox" class="hid" name="product_cold_brew" id="product_cold_brew" checked><label for="product_cold_brew"><a class="category_set_btn on">콜드브루</a></label></li>
                                    <li class="total_search_btn2"><input type="checkbox" class="hid" name="product_brood" id="product_brood" checked><label for="product_brood"><a class="category_set_btn on">브루드 커피</a></label></li>
                                    <li class="total_search_btn3"><input type="checkbox" class="hid" name="product_espresso" id="product_espresso" checked><label for="product_espresso"><a class="category_set_btn on">에스프레소</a></label></li>
                                    <li class="total_search_btn4"><input type="checkbox" class="hid" name="product_frappuccino" id="product_frappuccino" checked><label for="product_frappuccino"><a class="category_set_btn on">프라푸치노</a></label></li>
                                    <li class="total_search_btn5"><input type="checkbox" class="hid" name="product_blended" id="product_blended" checked><label for="product_blended"><a class="category_set_btn on">블렌디드</a></label></li>
                                    <li class="total_search_btn6"><input type="checkbox" class="hid" name="product_fizzo" id="product_fizzo" checked><label for="product_fizzo"><a class="category_set_btn on">스타벅스 피지오</a></label></li>
                                    <li class="total_search_btn7"><input type="checkbox" class="hid" name="product_tea" id="product_tea" checked><label for="product_tea"><a class="category_set_btn on">티(티바나)</a></label></li>
                                    <li class="total_search_btn8"><input type="checkbox" class="hid" name="product_etc" id="product_etc" checked><label for="product_etc"><a class="category_set_btn on">기타 제조 음료</a></label></li>
                                    <li class="total_search_btn9"><input type="checkbox" class="hid" name="product_juice" id="product_juice" checked><label for="product_juice"><a class="category_set_btn on">스타벅스 주스(병음료)</a></label></li>
                                </ul>
                            </div>
                        </div>
                    </fieldset>
                    <!-- 메뉴분류 선택 끝 -->
                    <!-- 음료 리스트 -->
                    <dl class="product_view_tab wrapper">
                        <dt class="dt1">
                            <a role="button" class="selected a1">사진으로 보기</a>
                        </dt>
                        <dd>
                            <div class="product_list">
                                <dl>
                                <c:choose>
						        <c:when test="${menuList != null && fn:length(menuList) > 0}">
						        <c:forEach var="i" items="${menuList}" varStatus="status">
								<c:choose>
								    <c:when test="${status.index == 0}">
                                	<dt class="menu_class_0"><div id="menu_class_0" class="h_box"></div><span class="ttl">콜드 브루 커피</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
		                    	<span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 1}">
								    <dt class="menu_class_1"><div id="menu_class_1" class="h_box"></div><span class="ttl">브루드 커피</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 2}">
								    <dt class="menu_class_2"><div id="menu_class_2" class="h_box"></div><span class="ttl">에스프레소</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 3}">
								    <dt class="menu_class_3"><div id="menu_class_3" class="h_box"></div><span class="ttl">프라푸치노</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 4}">
								    <dt class="menu_class_4"><div id="menu_class_4" class="h_box"></div><span class="ttl">블렌디드</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 5}">
								    <dt class="menu_class_5"><div id="menu_class_5" class="h_box"></div><span class="ttl">스타벅스 피지오</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 6}">
								    <dt class="menu_class_6"><div id="menu_class_6" class="h_box"></div><span class="ttl">티(티바나)</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:when test="${status.index == 7}">
								    <dt class="menu_class_7"><div id="menu_class_7" class="h_box"></div><span class="ttl">기타 제조 음료</span><i class="summaryIcon"><img src="//image.istarbucks.co.kr/common/img/menu/logo_decaf.png"></i>
			                    <span class="summary">디카페인 에스프레소 샷 추가 가능 (일부 음료 제외)</span></dt>
								    </c:when>
								    <c:otherwise>
								    <dt class="menu_class_8"><div id="menu_class_8" class="h_box"></div><span class="ttl">스타벅스 주스(병음료)</span></dt>
								    </c:otherwise>
								</c:choose>
								
                                 <!-- 사진보기 메뉴 -->
                                 <dd class="menu_class_${status.index}">
		                           <ul class="clear">
                                	<c:choose>
							        	<c:when test="${i != null && fn:length(i) > 0 }">
						            		<c:forEach var="item" items="${i}">
		                                           <li class="menuDataSet">
		                                               <dl>
		                                                   <dt>
		                                                       <a href="${pageContext.request.contextPath}/product/menu_detail/${item.id}" class="goDrinkView"><img src="${item.list_img}" alt="${item.name}"></a>
		                                                   </dt>
		                                                   <dd>${item.name}</dd>
		                                               </dl>
		                                           </li>
								            </c:forEach>
								        </c:when>
								    </c:choose>
                                    </ul>
                                 </dd>
                                 <!-- 사진보기 메뉴 끝 -->
					            </c:forEach>
						        </c:when>
							    </c:choose>
                                </dl>
                            </div>
                        </dd>
                        <dt class="dt2">
                            <a role="button" class="a2">영양정보로 보기</a>
                        </dt>
                        <!-- 영양정보 메뉴 -->
                        <dd>
                        	<div class="product_list">
                        	<c:choose>
					        <c:when test="${menuList != null && fn:length(menuList) > 0}">
					        <c:forEach var="i" items="${menuList}" varStatus="status">
                            
	                            <c:choose>
								    <c:when test="${status.index == 0}">
								    <h3 class="menu_class_0">콜드 브루 커피</h3>
								    </c:when>
								    <c:when test="${status.index == 1}">
								    <h3 class="menu_class_1">브루드 커피</h3>
								    </c:when>
								    <c:when test="${status.index == 2}">
								    <h3 class="menu_class_2">에스프레소</h3>
								    </c:when>
								    <c:when test="${status.index == 3}">
								    <h3 class="menu_class_3">프라푸치노</h3>
								    </c:when>
								    <c:when test="${status.index == 4}">
								    <h3 class="menu_class_4">블렌디드</h3>
								    </c:when>
								    <c:when test="${status.index == 5}">
								    <h3 class="menu_class_5">스타벅스 피지오</h3>
								    </c:when>
								    <c:when test="${status.index == 6}">
								    <h3 class="menu_class_6">티(티바나)</h3>
								    </c:when>
								    <c:when test="${status.index == 7}">
								    <h3 class="menu_class_7">기타 제조 음료</h3>
								    </c:when>
								    <c:otherwise>
								    <h3 class="menu_class_8">스타벅스 주스(병음료)</h3>
								    </c:otherwise>
								</c:choose>
							
                            <table class="coffeeInfo mb60 menu_class_${status.index}">
                                <caption class="hid">메뉴, 칼로리, 당류, 단백질, 나트륨, 포화지방, 카페인 정보</caption>
                                <colgroup>
                                    <col width="16%">
                                    <col width="14%">
                                    <col width="14%">
                                    <col width="14%">
                                    <col width="14%">
                                    <col width="14%">
                                    <col width="14%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">메뉴</th>
                                        <th scope="col">칼로리(Kcal)</th>
                                        <th scope="col">당류(g)</th>
                                        <th scope="col">단백질(g)</th>
                                        <th scope="col">나트륨(mg)</th>
                                        <th scope="col">포화지방(g)</th>
                                        <th scope="col">카페인(mg)</th>
                                    </tr>
                                </thead>
                                <tbody>
	                                <c:choose>
							        <c:when test="${i != null && fn:length(i) > 0 }">
						            <c:forEach var="item" items="${i}">
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/product/menu_detail/${item.id}" class="goDrinkView">${item.name}</a></td>
                                        <td>${item.kcal}</td>
                                        <td>${item.sugars}</td>
                                        <td>${item.protein}</td>
                                        <td>${item.salt}</td>
                                        <td>${item.fat}</td>
                                        <td>${item.caffeine}</td>
                                    </tr>
						            </c:forEach>
							        </c:when>
								    </c:choose>
                                </tbody>
                            </table>
				            </c:forEach>
					        </c:when>
						    </c:choose>
						    </div>
                        </dd>
                        <!-- 영양정보 메뉴 끝 -->
                    </dl>
                    <!-- 음료 리스트 끝 -->
                </div>
            </div>
            <!-- 내용 끝 -->
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

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
            
            
            if ($("#product_cold_brew").prop('checked')) {
            	$('.menu_class_0').show();
            } else {
            	$('.menu_class_0').hide();
            }
            
            if ($("#product_brood").prop('checked')) {
            	$('.menu_class_1').show();
            } else {
            	$('.menu_class_1').hide();
            }
            
            if ($("#product_espresso").prop('checked')) {
            	$('.menu_class_2').show();
            } else {
            	$('.menu_class_2').hide();
            }
            
            if ($("#product_frappuccino").prop('checked')) {
            	$('.menu_class_3').show();
            } else {
            	$('.menu_class_3').hide();
            }
            
            if ($("#product_blended").prop('checked')) {
            	$('.menu_class_4').show();
            } else {
            	$('.menu_class_4').hide();
            }
            
            if ($("#product_fizzo").prop('checked')) {
            	$('.menu_class_5').show();
            } else {
            	$('.menu_class_5').hide();
            }
            
            if ($("#product_tea").prop('checked')) {
            	$('.menu_class_6').show();
            } else {
            	$('.menu_class_6').hide();
            }
            
            if ($("#product_etc").prop('checked')) {
            	$('.menu_class_7').show();
            } else {
            	$('.menu_class_7').hide();
            }
            
            if ($("#product_juice").prop('checked')) {
            	$('.menu_class_8').show();
            } else {
            	$('.menu_class_8').hide();
            }
            
            return false;
        });

        // 카테고리 상세보기 전체선택 버튼
        $(document).on("change", "#product_all", function() {
        	
            if ($("#product_all").prop('checked')) {
                $("div.menu_btns > ul > li > label > a").addClass("on");
                $("div.menu_btns > ul > li > input").prop('checked', true);
            } else {
                $("div.menu_btns > ul > li > label > a").removeClass("on");
                $("div.menu_btns > ul > li > input").prop('checked', false);
            }
            

            if ($("#product_cold_brew").prop('checked')) {
            	$('.menu_class_0').show();
            } else {
            	$('.menu_class_0').hide();
            }
            
            if ($("#product_brood").prop('checked')) {
            	$('.menu_class_1').show();
            } else {
            	$('.menu_class_1').hide();
            }
            
            if ($("#product_espresso").prop('checked')) {
            	$('.menu_class_2').show();
            } else {
            	$('.menu_class_2').hide();
            }
            
            if ($("#product_frappuccino").prop('checked')) {
            	$('.menu_class_3').show();
            } else {
            	$('.menu_class_3').hide();
            }
            
            if ($("#product_blended").prop('checked')) {
            	$('.menu_class_4').show();
            } else {
            	$('.menu_class_4').hide();
            }
            
            if ($("#product_fizzo").prop('checked')) {
            	$('.menu_class_5').show();
            } else {
            	$('.menu_class_5').hide();
            }
            
            if ($("#product_tea").prop('checked')) {
            	$('.menu_class_6').show();
            } else {
            	$('.menu_class_6').hide();
            }
            
            if ($("#product_etc").prop('checked')) {
            	$('.menu_class_7').show();
            } else {
            	$('.menu_class_7').hide();
            }
            
            if ($("#product_juice").prop('checked')) {
            	$('.menu_class_8').show();
            } else {
            	$('.menu_class_8').hide();
            }
            
            return false;
        });


        // 카테고리 상세보기 선택 버튼
        $(document).on("change", "div.menu_btns > ul > li > input", function() {
        	
            if ($(this).prop('checked')) {
                $(this).next().children().addClass("on");
            } else {
                $(this).next().children().removeClass("on");
            }
            
            if ($("#product_cold_brew").prop('checked')) {
            	$('.menu_class_0').show();
            } else {
            	$('.menu_class_0').hide();
            }
            
            if ($("#product_brood").prop('checked')) {
            	$('.menu_class_1').show();
            } else {
            	$('.menu_class_1').hide();
            }
            
            if ($("#product_espresso").prop('checked')) {
            	$('.menu_class_2').show();
            } else {
            	$('.menu_class_2').hide();
            }
            
            if ($("#product_frappuccino").prop('checked')) {
            	$('.menu_class_3').show();
            } else {
            	$('.menu_class_3').hide();
            }
            
            if ($("#product_blended").prop('checked')) {
            	$('.menu_class_4').show();
            } else {
            	$('.menu_class_4').hide();
            }
            
            if ($("#product_fizzo").prop('checked')) {
            	$('.menu_class_5').show();
            } else {
            	$('.menu_class_5').hide();
            }
            
            if ($("#product_tea").prop('checked')) {
            	$('.menu_class_6').show();
            } else {
            	$('.menu_class_6').hide();
            }
            
            if ($("#product_etc").prop('checked')) {
            	$('.menu_class_7').show();
            } else {
            	$('.menu_class_7').hide();
            }
            
            if ($("#product_juice").prop('checked')) {
            	$('.menu_class_8').show();
            } else {
            	$('.menu_class_8').hide();
            }
            
            return false;
        });
    });
    </script>
</body>

</html>