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
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">My 스타벅스 e-Gift Card</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">선물내역</span></a></li>
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
                    <form method="post">
                        <fieldset>
                            <legend>기간 선택 폼</legend>
                            <dl class="my_card_pick_bg">
                                <dt>기간별</dt>
                                <dd>
                                    <input type="radio" id="pickPeriod2" name="pickPeriod" checked="checked" value="1_MONTH" />
                                    <label for="pickPeriod2">1개월</label>
                                    <input type="radio" id="pickPeriod4" name="pickPeriod" checked="checked" value="1_YEAR" />
                                    <label for="pickPeriod4">1년</label>
                                </dd>
                            </dl>
                            <dl class="my_card_pick_date">
                                <dt>일자별</dt>
                                <dd>
                                    <input type="date" id="pickDate01" name="pickDate" title="원하는 날짜를 선택해 주세요.">
                                    <p class="hyphen_bg"></p>
                                    <input type="date" id="pickDate02" name="pickDate" title="원하는 날짜를 선택해 주세요.">
                                    <p class="btn_pick_date">
                                        <a href="${pageContext.request.contextPath}/">검색</a>
                                    </p>
                                </dd>
                            </dl>
                        </fieldset>
                    </form>
                </section>
                <!-- 기간선택 끝 -->
                <p class="my_card_date_refer">최대 조회 기간은 5년입니다.</p>
                <!-- 목록 -->
                <section class="eGift_list_wrap">
                    <ul class="eGift_list_inner">
                        <li class="clear">
                            <article class="eGift_list_z01 clear">
                                <p class="num">1</p>
                                <ul class="eGift_list_ul">
                                    <li class="clear">
                                        <div class="eGift_infor_wrap clear">
                                            <div class="eGift_infor_inner">
                                                <div class="eGift_infor_01">
                                                    <p class="eGift_card">
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20201229/007764.png" alt="e-gift 카드">
                                                    </p>
                                                    <dl class="eGift_text clear">
                                                        <dt>메&nbsp;시&nbsp;지</dt>
                                                        <dd class="clear">나에게 선물</dd>
                                                        <dt>받는 사람:</dt>
                                                        <dd class="last">이름 [이메일]</dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eGift_infor_wrap02">
                                            <div class="eGift_infor_inner">
                                                <div class="eGift_infor_02">
                                                    <dl class="eGift_text02 clear">
                                                        <dt>단가 :&nbsp;</dt>
                                                        <dd class="clear">10,000원</dd>
                                                        <dt>주문수량 :&nbsp;</dt>
                                                        <dd class="clear">1장</dd>
                                                        <dt>가격 :&nbsp;</dt>
                                                        <dd>10,000원</dd>
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
                                            <dd class="clear">10,000원</dd>
                                            <dt>결제일 :&nbsp;</dt>
                                            <dd>2021-01-28</dd>
                                        </dl>
                                        <ul class="btn_eGift_z02 clear">
                                            <li class="btn_eGift_b01">
                                                <a href="${pageContext.request.contextPath}/" class="goView" data-egiftpgtransseq="2021012844186794">상세보기</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </article>
                        </li>
                        <li class="clear">
                            <article class="eGift_list_z01 clear">
                                <p class="num">2</p>
                                <ul class="eGift_list_ul">
                                    <li class="clear">
                                        <div class="eGift_infor_wrap clear">
                                            <div class="eGift_infor_inner">
                                                <div class="eGift_infor_01">
                                                    <p class="eGift_card">
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20201229/007764.png" alt="e-gift 카드">
                                                    </p>
                                                    <dl class="eGift_text clear">
                                                        <dt>메&nbsp;시&nbsp;지</dt>
                                                        <dd class="clear">나에게 선물</dd>
                                                        <dt>받는 사람:</dt>
                                                        <dd class="last">이름 [이메일]</dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="eGift_infor_wrap02">
                                            <div class="eGift_infor_inner">
                                                <div class="eGift_infor_02">
                                                    <dl class="eGift_text02 clear">
                                                        <dt>단가 :&nbsp;</dt>
                                                        <dd class="clear">10,000원</dd>
                                                        <dt>주문수량 :&nbsp;</dt>
                                                        <dd class="clear">1장</dd>
                                                        <dt>가격 :&nbsp;</dt>
                                                        <dd>10,000원</dd>
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
                                            <dd class="clear">10,000원</dd>
                                            <dt>결제일 :&nbsp;</dt>
                                            <dd>2021-01-28</dd>
                                        </dl>
                                        <ul class="btn_eGift_z02 clear">
                                            <li class="btn_eGift_b01">
                                                <a href="${pageContext.request.contextPath}/" class="goView" data-egiftpgtransseq="2021012844186794">상세보기</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </article>
                        </li>
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