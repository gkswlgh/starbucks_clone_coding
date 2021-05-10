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
                        <li><a href="${pageContext.request.contextPath}/mypage"><span class="en">My Starbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/voclist"><span class="en">My 고객의 소리</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <c:choose>
					<c:when test="${voc != null}">
					<section class="my_suggestion_view_top clear" style="word-break:break-all;height:auto">
	                    <dl>
	                        <dd class="text clear">
	                            ${voc.voc_ttl}
	                        </dd>
	                    </dl>
	                </section>
	                <section class="my_suggestion_view_file clear">
	                    <article class="view_file_info">
	                        <dl id="dl_y" class="reg_page">
	                            <dt> 매장 방문 여부
	                            <c:if test="${voc.visit_store eq 'Y'}">
	                                <span>|&nbsp;&nbsp;&nbsp; 매장 방문</span>
	                            </c:if>
	                            <c:if test="${voc.visit_store eq 'N'}">
	                                <span>|&nbsp;&nbsp;&nbsp; 매장 방문 외</span>
	                            </c:if>
	                            </dt>
	                            <c:if test="${voc.visit_store eq 'Y'}">
	                            <dd style="margin-top:17px;">
	                                <span>(${voc.store_name}, ${voc.visit_date})</span>
	                            </dd>
	                            </c:if>
	                        </dl>
	                        <ul>
	                            <li style="margin-top:-7px;">
	                                <p class="date1">
	                                    등&nbsp;&nbsp;&nbsp;록&nbsp;&nbsp;&nbsp;일 : ${voc.reg_date}
	                                </p>
	                            </li>
	                        </ul>
	                    </article>
	                </section>
	                <section class="text_info_wrap">
	                    <article class="text_info_box" style="word-break:break-all;">
	                       ${voc.voc_txt}
	                    </article>
	                </section>
					</c:when>
				</c:choose>
				
                <c:choose>
					<c:when test="${vocRe != null}">
                <section class="admin_text_info_wrap">
                    <article class="admin_text_info clear">
                        <dl class="admin_info">
                            <dt>답변일:</dt>
                            <dd>${vocRe.reg_date}</dd>
                        </dl>
                    </article>
                    <article class="admin_text_info_box" style="word-break:break-all">
                        ${vocRe.voc_re_txt}
                    </article>
                </section>
					</c:when>
				</c:choose>
                <div class="suggestion_btnZone">
                    <p class="btn_list">
                        <a href="${pageContext.request.contextPath}/my/voclist" onclick="return false;">목록</a>
                    </p>
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>