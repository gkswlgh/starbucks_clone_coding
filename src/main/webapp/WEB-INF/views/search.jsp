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
                    <h4>검색</h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/search"><span class="en">검색</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="wrapper">
            <div class="inner">
                <!-- 통합검색 입력 -->
				<form method="get" action="${pageContext.request.contextPath}/search">
                <fieldset>
                    <legend class="hid">통합검색 입력</legend>
                    <div class="search_input_wrap">
                        <strong>원하시는 검색어를 입력하신 후 검색 버튼을 클릭하세요.</strong>
                        <div class="search_input">
                            <input type="search" placeholder="이름으로 검색" name="keyword" id="keyword" value="${keyword}" /> <button type="submit" id="search_btn" class="search_btn">검색</button>
                        </div>
                    </div>
                </fieldset>
                </form>
                <!-- 통합검색 입력 끝 -->
                <!-- 검색 결과 -->
	                <c:choose>
		                <c:when test="${keyword == null || keyword == ''}">
	                		<p class="sch_no_result">검색어를 입력해주세요.</p>
				        </c:when>
						<c:otherwise>
	                		<c:choose>
					        <c:when test="${output != null && fn:length(output) > 0}">
				                <section class="contents_wrap card_search_result search_coffee">
				                    <header class="search_result_each_ttl">
				                        <h2>메뉴</h2>
				                        <a href="${pageContext.request.contextPath}/product/menu_list">다른 메뉴 더보기</a>
				                    </header>
				                    <ul class="search_coffee_wrap">
				        			<c:forEach var="item" items="${output}" varStatus="status">
				        				<%-- 출력을 위해 준비한 메뉴 이름 변수 --%>
										<c:set var="name" value="${item.name}" />
										<%-- 검색어가 있다면? --%>
										<c:if test="${keyword != ''}">
											<%-- 검색어에 mark태그를 적용하여 형광팬효과 준비 --%>
											<c:set var="mark" value="<span class='yellow_bg'>${keyword}</span>" />
											<%-- 출력을 위해 준비한 이름에서 검색어와 일치하는
					    						단어를 형광팬효과로 변경 --%>
											<c:set var="name" value="${fn:replace(name,keyword,mark)}" />
										</c:if>
				        				<%-- 출력을 위해 준비한 메뉴 이름 변수 --%>
										<c:set var="eng_name" value="${item.eng_name}" />
										<%-- 검색어가 있다면? --%>
										<c:if test="${keyword != ''}">
											<%-- 검색어에 mark태그를 적용하여 형광팬효과 준비 --%>
											<c:set var="mark" value="<span class='yellow_bg'>${keyword}</span>" />
											<%-- 출력을 위해 준비한 이름에서 검색어와 일치하는
					    						단어를 형광팬효과로 변경 --%>
											<c:set var="eng_name" value="${fn:replace(eng_name,keyword,mark)}" />
										</c:if>
										<%-- 상세페이지로 이동하기 위한 URL --%>
										<c:url value="${pageContext.request.contextPath}/product/menu_detail/${item.id}" var="viewUrl">
										</c:url>
				                        <li>
				                            <figure>
			                                    <a href="${viewUrl}" class="en" target="_blank">
				                                	<img src="${item.list_img}">
			                                    </a>
				                            </figure>
				                            <div class="card_search_result_txt">
				                                <header>
				                                    <h3 class="rt_title">
					                                    <a href="${viewUrl}" class="en" target="_blank">
					                                        ${name}&nbsp;(${eng_name})
					                                    </a>
				                                    </h3>
				                                </header>
				                                <p class="card_search_result_cont rt_text">
				                                    <a href="${viewUrl}" class="en" target="_blank">
				                                    	${item.description}
			                                    	</a>
				                                </p>
				                                <p class="card_search_result_link">
				                                    <a href="${viewUrl}" class="en" target="_blank">
				                                        ${viewUrl}
				                                    </a>
				                                </p>
				                            </div>
				                        </li>
				                        </c:forEach>
				                    </ul>
				                </section>
					        </c:when>
							<c:otherwise>
		                		<p class="sch_no_result">검색 결과가 없습니다.</p>
							</c:otherwise>
				    		</c:choose>
						</c:otherwise>
				    </c:choose>
                <!-- 검색 결과 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>