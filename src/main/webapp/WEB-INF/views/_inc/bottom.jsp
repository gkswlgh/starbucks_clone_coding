<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 푸터시작 -->
    <div id="footer">
        <div class="footer_menus">
            <div class="footer_menus_inner">
                <div class="menus_up clear">
                    <ul>
                        <li class="footer_menu_ttl"><a href="${pageContext.request.contextPath}/" class="en">ONLINE
                                COMMUNITY</a></li>
                        <li><a href="https://www.facebook.com/starbuckskorea" target="_blank">페이스북</a></li>
                        <li><a href="https://twitter.com/StarbucksKorea" target="_blank">트위터</a></li>
                        <li><a href="https://www.youtube.com/channel/UCaxvyTYdWaDXupmgj5ttDUQ" target="_blank">유튜브</a></li>
                        <li><a href="https://blog.naver.com/starbuckskor" target="_blank">블로그</a></li>
                        <li><a href="https://www.instagram.com/starbuckskorea/" target="_blank">인스타그램</a></li>
                    </ul>
                    <ul>
                        <li class="footer_menu_ttl"><a href="${pageContext.request.contextPath}/" class="en">RECRUIT</a></li>
                        <li><a href="http://job.shinsegae.com/recruit_info/notice/notice02_view.jsp?notino=2895" target="_blank">채용 지원하기</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 수상내역 -->
        <div class="footer_awards">
            <div class="footer_awards_inner">
                <!-- 슬라이더 -->
                <div class="awards_slider_wrap">
                    <div class="awards_slider_inner">
                        <ul class="awards_slider">
                            <li><img src="${pageContext.request.contextPath}/assets/img/footer/footer_award17_01.jpg" alt="고용노동부 2016년 고용창출 100개 우수기업 4년 연속 표창" /></li>
                            <li><img src="${pageContext.request.contextPath}/assets/img/footer/footer_award17_02.jpg" alt="고용노동부 2016년 장애인고용촉진대회 장애인고용촉진 유공 포상" /></li>
                            <li><img src="${pageContext.request.contextPath}/assets/img/footer/footer_award17_03.jpg" alt="환경부 2016년 그린킹 캠페인 온실가스 저감 우수 모범 기업" /></li>
                            <li><img src="${pageContext.request.contextPath}/assets/img/footer/footer_award17_04.jpg" alt="농림축산식품부 2016년 농식품 상생협력 활동 우수사례 기업" /></li>
                            <li><img src="${pageContext.request.contextPath}/assets/img/footer/footer_award17_05.jpg" alt="2016년 대한민국 여성인재경영대상 우수사례 기업" /></li>
                            <li><img src="${pageContext.request.contextPath}/assets/img/footer/footer_award17_06.jpg" alt="2016년 한국 최고의 직장 톱10 본상" /></li>
                        </ul>
                    </div>
                </div>
                <!-- 컨트롤러 -->
                <div class="slider_controller">
                    <a class="slider_stop">Stop</a> <a class="slider_start">Start</a>
                </div>
            </div>
        </div>
        <!-- 수상내역끝 -->
        <aside class="copyright">
            <div class="copyright_inner">
                <ul class="link_btn">
                    <li><a href="https://www.google.co.kr/maps/search/%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4" target="_blank">매장 찾기</a></li>
                    <li><a href="${pageContext.request.contextPath}/sitemap">사이트 맵</a></li>
                </ul>
                <ul class="copy">
                    <li>사업자등록번호 : 000-00-00000</li>
                    <li>(주)스타벅스커피 코리아 대표이사 : 차이 티 라떼</li>
                    <li>TEL : 0000-0000</li>
                    <li>개인정보 책임자 : 참치김밥</li>
                </ul>
                <address class="copy_en en">&copy; 2020 Starbucks Coffee
                    Company. All Rights Reserved. <br />
* 취업을 위한 학생용 포트폴리오 사이트 입니다. <br />
* 한지호 학생 제작</address>
            </div>
        </aside>
    </div>
    <!-- 푸터끝 -->
    
<script src="${pageContext.request.contextPath}/assets/js/header.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/contents.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/footer.js?time=<%=System.currentTimeMillis()%>"></script>