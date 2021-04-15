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
                        <img src="//image.istarbucks.co.kr/common/img/util/reward/ms_suggestion_ttl.png" alt="고객의 소리" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">My Starbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">My 고객의 소리</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <section class="my_suggestion_view_top clear" style="word-break:break-all;height:auto">
                    <dl>
                        <dd class="text clear">
                            말차 초콜릿 라떼
                        </dd>
                    </dl>
                </section>
                <section class="my_suggestion_view_file clear">
                    <article class="view_file_info">
                        <dl id="dl_y" class="reg_page">
                            <dt> 첨부파일
                                <span>|</span>
                            </dt>
                            <dd>
                                <span></span>
                            </dd>
                        </dl>
                        <ul>
                            <li style="margin-top:-7px;">
                                <p class="date1">
                                    등&nbsp;&nbsp;&nbsp;록&nbsp;&nbsp;&nbsp;일 : 2021-01-29
                                </p>
                            </li>
                            <li style="display:none">
                                <p class="icon_complete">
                                    <span>답변 완료</span>
                                </p>
                            </li>
                        </ul>
                    </article>
                </section>
                <section class="text_info_wrap">
                    <article class="text_info_box" style="word-break:break-all;">
                        얼마전까지 이벤트했던 말차초콜릿라떼 이제 판매안하나요?
                    </article>
                </section>
                <section class="admin_text_info_wrap">
                    <article class="admin_text_info clear">
                        <dl class="admin_info">
                            <dt>답변일:</dt>
                            <dd>2021-01-29</dd>
                        </dl>
                    </article>
                    <article class="admin_text_info_box" style="word-break:break-all">
                        안녕하십니까? 고객님.
                        <br>
                        스타벅스커피 코리아입니다.
                        <br><br>
                        우선 스타벅스의 [말차 초콜릿 라떼]음료를 애용해주셔서 감사드립니다.
                        <br><br>
                        해당음료는 2021 New Year 프로모션 음료로 현재 판매 종료 되었으며,
                        <br>
                        현재로써는 코어메뉴로 운영 계획이 없어 긍정적인 답변드리기 어려운 점 너그러운 양해 바랍니다.
                        <br><br><br>
                        앞으로도 지금처럼 스타벅스에 많은 관심과 격려 부탁드리며, 언제나 스타벅스만의 경험을 드릴 수 있도록 노력하겠습니다.
                        <br>
                        감사합니다.
                    </article>
                </section>
                <div class="suggestion_btnZone">
                    <p class="btn_list">
                        <a href="${pageContext.request.contextPath}/" onclick="return false;">목록</a>
                    </p>
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>