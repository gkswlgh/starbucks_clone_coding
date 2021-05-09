<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <div id="sitemap">
        <div id="container">
            <!-- 서브타이틀 -->
            <header class="sub_tit_wrap">
                <div class="sub_tit_bg">
                    <div class="sub_tit_inner">
                        <h4>
                            <img src="//image.istarbucks.co.kr/common/img/footer/etc/tit8.png" alt="사이트 맵" />
                        </h4>
                        <ul class="smap">
                            <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                            <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                            <li><a href="${pageContext.request.contextPath}/sitemap"><span class="en">사이트맵</span></a></li>
                        </ul>
                    </div>
                </div>
            </header>
            <!-- 서브타이틀 끝 -->
            <!-- 내용 -->
            <div class="cont">
                <div class="cont_inner">
                    <!-- 테이블 -->
                    <div class="voc_input_tbl">
                        <table summary="사이트 맵을 정리한 테이블" class="sitemap">
                            <caption>스타벅스 코리아 사이트 맵입니다.</caption>
                            <colgroup>
                                <col width="200" />
                                <col width="740" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">COFFEE</th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/coffee_finder">나와 어울리는 커피</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">MENU</th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/product/menu_list">음료</a></li>
                                                <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_0">- 콜드브루</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_1">- 브루드 커피</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_2">- 에스프레소</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_3">- 프라푸치노</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_4">- 블렌디드</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_5">- 스타벅스 피지오</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_6">- 티(티바나)</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_7">- 기타 제조 음료</a></li>
	                                            <li><a href="${pageContext.request.contextPath}/product/menu_list#menu_class_8">- 스타벅스 주스(병음료)</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">STORE</th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/">오프라인 매장 찾기</a></li>
                                                <li><a href="${pageContext.request.contextPath}/">- 퀵 검색</a></li>
                                                <li><a href="${pageContext.request.contextPath}/">- 지역 검색</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">STARBUCKS CARDS</th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/starbucks_card/about_card">스타벅스 카드</a></li>
                                                <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card">- 스타벅스 카드 소개</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/mycard_info_input">- 카드 등록하기</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/mycard_charge">- 카드 충전하기</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/starbucks_card/about_egift">스타벅스 e-Gift
                                                        Card</a></li>
                                                <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift">- 스타벅스 e-Gift Card 소개</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/gift_step1">- 선물하기</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><a href="${pageContext.request.contextPath}/mypage">MY STARBUCKS</a></th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/my/mycard_list">My 스타벅스 카드</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/mycard_list">- 보유 카드</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/mycard_info_input">- 카드 등록</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/mycard_charge">- 카드 충전</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/my/egift_card">My e-Gift
                                                        Card</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/gift_step1">- 선물하기</a></li>
                                                <li><a href="${pageContext.request.contextPath}/my/egift_card">- 선물 내역</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/my/my_menu">My 메뉴</a></li>
                                            </ul>
                                        </div>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/my/cart_step1">장바구니</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/my/order_list">주문 내역</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/my/voclist">My 고객의 소리</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/mypage">개인정보관리</a></li>
                                                <li><a href="${pageContext.request.contextPath}/account/myinfo_modify">- 개인정보확인 및 수정</a></li>
                                                <li><a href="${pageContext.request.contextPath}/account/join_out">- 비밀번호 변경</a></li>
                                                <li><a href="${pageContext.request.contextPath}/account/myinfo_change_pw">- 회원 탈퇴</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">CUSTOMER SERVICE &amp; IDEAS</th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="${pageContext.request.contextPath}/voc">고객의 소리</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">ONLINE COMMUNITY</th>
                                    <td>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="https://twitter.com/StarbucksKorea" target="_blank">트위터</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="https://www.instagram.com/starbuckskorea/" target="_blank">인스타그램</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="https://www.facebook.com/starbuckskorea" target="_blank">페이스북</a></li>
                                            </ul>
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="https://blog.naver.com/starbuckskor" target="_blank">블로그</a></li>
                                            </ul>
                                        </div>
                                        <div class="sitemap clear">
                                            <ul>
                                                <li class="sitemap_li_ttl"><a href="https://www.youtube.com/channel/UCaxvyTYdWaDXupmgj5ttDUQ" target="_blank">유튜브</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 테이블 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>