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
                        <img src="//image.istarbucks.co.kr/common/img/util/receipt_ttl.png" alt="전자 영수증" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">전자영수증</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
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
                            <div class="my_card_pick_date2 clear">
                                <dl>
                                    <dt>결제수단</dt>
                                    <dd>
                                        <div class="select_box">
                                            <label for="value" for="myinfo_date01">전체보기</label>
                                            <select id="myinfo_date01">
                                                <option value="W">전체보기</option>
                                                <option value="S">스타벅스 카드</option>
                                                <option value="E">스타벅스 카드 외</option>
                                            </select>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>거래유형</dt>
                                    <dd>
                                        <div class="select_box">
                                            <label for="value" for="myinfo_date02">전체보기</label>
                                            <select id="myinfo_date02">
                                                <option value="W">전체보기</option>
                                                <option value="P">결제</option>
                                                <option value="R">충전</option>
                                            </select>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                        </fieldset>
                    </form>
                </section>
                <!-- 기간선택 끝 -->
                <p class="my_card_date_refer">최대 조회 기간은 5년입니다.</p>
                <!-- 카드내역표 -->
                <table class="coffeeInfo mb60 mt20">
                    <caption class="hid">No, 거래구분, 구분, 매장명, 금액, 날짜, 전자영수증</caption>
                    <colgroup>
                        <col width="56">
                        <col width="105">
                        <col width="135">
                        <col width="132">
                        <col width="147">
                        <col width="165">
                        <col width="90">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="en" scope="col">No</th>
                            <th scope="col">거래구분</th>
                            <th scope="col">구분</th>
                            <th scope="col">매장명</th>
                            <th scope="col">금액</th>
                            <th scope="col">날짜</th>
                            <th scope="col">전자영수증</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>충전</td>
                            <td>스타벅스 카드</td>
                            <td>온라인</td>
                            <td>10000</td>
                            <td>2021-01-28 21:57:02</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <!-- 카드내역표 끝 -->
                <!-- 페이징 -->
                <div class="egiftCard_tbl_pagination">
                    <ul class="pager">
                        <li class="active"><a href="${pageContext.request.contextPath}/">1</a></li>
                    </ul>
                </div>
                <!-- 페이징 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
</body>

</html>