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
                        <img src="${pageContext.request.contextPath}/assets/img/util/ms_egift_ttl.png" alt="선물내역" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks"><span class="en">My Starbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift"><span class="en">My 스타벅스 e-Gift Card</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/egift_card"><span class="en">선물내역</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <!-- 선물내역 -->
                <!-- 기간선택 -->
                <section class="my_card_pick_period">
                    <form action="${pageContext.request.contextPath}/my/egift_card" method="post">
                        <fieldset>
                            <legend>기간 선택 폼</legend>
                            <dl class="my_card_pick_bg">
                                <dt>기간별</dt>
                                <dd>
                                    <input type="radio" id="pickPeriod1" name="pickPeriod" value="-1" 
                                    <c:if test="${pickPeriod == -1}"> checked</c:if>
									/>
                                    <label for="pickPeriod1">1개월</label>
                                    <input type="radio" id="pickPeriod2" name="pickPeriod" value="-12" 
                                    <c:if test="${pickPeriod == -12}"> checked</c:if>
                                    />
                                    <label for="pickPeriod2">1년</label>
                                    <input type="radio" id="pickPeriod3" name="pickPeriod" value="-36" 
                                    <c:if test="${pickPeriod == -36}"> checked</c:if>
                                    />
                                    <label for="pickPeriod3">3년</label>
	                               <p class="btn_pick_date">
	                                   <button type="submit">검색</button>
	                               </p>
                                </dd>
                            </dl>
                        </fieldset>
                    </form>
                </section>
                <!-- 기간선택 끝 -->
                	<p class="my_card_date_refer">최대 조회 기간은 3년입니다.</p>
                <!-- 목록 -->
                <section class="eGift_list_wrap">
                    <ul class="eGift_list_inner">
                    <c:choose>
			        	<c:when test="${output != null && fn:length(output) > 0}">
		            		<c:forEach var="output" items="${output}" varStatus="status">
                    <li class="clear">
                            <article class="eGift_list_z01 clear">
                                <p class="num">${status.index + 1}</p>
                                <ul class="eGift_list_ul">
                                    <li class="clear">
                                        <div class="eGift_infor_wrap clear">
                                            <div class="eGift_infor_inner">
                                                <div class="eGift_infor_01">
                                                    <p class="eGift_card">
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt="e-gift 카드">
                                                    </p>
                                                    <dl class="eGift_text clear">
                                                        <dt>메&nbsp;시&nbsp;지</dt>
                                                        <dd class="clear" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${output.message}</dd>
                                                        <dt>받는 사람:</dt>
                                                        <dd class="last">${output.to_mem_name} [ ${output.to_mem_email} ]</dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eGift_infor_wrap02">
                                            <div class="eGift_infor_inner">
                                                <div class="eGift_infor_02">
                                                    <dl class="eGift_text02 clear">
                                                        <dt>단가 :&nbsp;</dt>
                                                        <dd class="clear">${output.gift_price}원</dd>
                                                        <dt>주문수량 :&nbsp;</dt>
                                                        <dd class="clear">1장</dd>
                                                        <dt>가격 :&nbsp;</dt>
                                                        <dd>${output.gift_price}원</dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="eGift_infor_wrap03 clear">
                                    <div class="eGift_infor_03">
                                        <dl class="eGift_text03 clear">
                                            <dt>결제수단 :&nbsp;</dt>
                                            <dd class="clear">신용카드</dd>
                                            <dt>결제금액 :&nbsp;</dt>
                                            <dd class="clear">${output.gift_price}원</dd>
                                            <dt>결제일 :&nbsp;</dt>
                                            <dd>${output.reg_date}</dd>
                                        </dl>
                                        <ul class="btn_eGift_z02 clear">
                                            <li class="btn_eGift_b01">
                                                <a href="${pageContext.request.contextPath}/my/egift_card_view/${output.gift_id}">상세보기</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </article>
                        </li>
				            </c:forEach>
				        </c:when>
			    <c:otherwise>
			    <li style="padding:60px;">검색 결과가 없습니다.
			    </li>
			    </c:otherwise>
				    </c:choose>
                    </ul>
                </section>
                <!-- 목록 끝 -->
                <!-- 페이징 -->
                <div class="egiftCard_tbl_pagination">
                    <ul class="pager">
                        <li class="active"><a href="${pageContext.request.contextPath}/">1</a></li>
                    </ul>
                </div>
                <!-- 페이징 끝 -->
                <!-- 선물내역 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>