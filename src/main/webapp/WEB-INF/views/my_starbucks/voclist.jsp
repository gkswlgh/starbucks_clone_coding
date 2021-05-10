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
                <!-- 인삿말 -->
                <div class="voc_top_bg">
                    <div class="voc_top_txt">
                        <strong> 귀한 말씀 들려 주십시오. 작은 소리도 듣겠습니다. </strong> <br />
                        <p>
                            스타벅스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다. 만족스러운
                            서비스였는지, <br /> 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다. 보다 나은 서비스로 보답하겠습니다.
                        </p>
                        <span>고객의 소리 운영시간 : 월~ 일 09:00 ~ 18:00 (연중무휴)</span>
                    </div>
                    <a href="${pageContext.request.contextPath}/voc" class="btn_ask_list">고객의 소리 문의하기</a>
                </div>
                <!-- 인삿말 끝 -->
                <!-- 고객의 소리 list -->
                <section class="my_suggestion_list">
                    <div class="suggestion_list_inner">
                        <dl class="content_tabmenu">
                            <dt class="tab tab_first tab_01 on">
                                <h6><a href="#tab_01" onclick="">전체</a></h6>
                            </dt>
                            <dt class="tab tab_02">
                                <h6><a href="#tab_02" onclick="">접수완료</a></h6>
                            </dt>
                            <dt class="tab tab_last tab_03">
                                <h6><a href="#tab_03" onclick="">답변완료</a></h6>
                            </dt>
                        </dl>
                        <dl>
                            <dd class="panel on">
                                <table class="suggestion_use_info_tbl" summary="고객의 소리 구분, 분야, 제목, 첨부파일, 작성일, 답변여부에 대한 테이블">
                                    <caption>고객의 소리 구분, 분야, 제목, 첨부파일, 작성일, 답변여부에 대한
                                        테이블</caption>
                                    <colgroup>
                                        <col width="50">
                                        <col width="350">
                                        <col width="113">
                                        <col width="113">
                                        <col width="204">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="en" scope="col">No</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">작성일</th>
                                            <th scope="col">답변일</th>
                                            <th scope="col">답변여부</th>
                                        </tr>
                                    </thead>
                                    <tbody id="all">
                                    <c:choose>
								        <c:when test="${vocList != null && fn:length(vocList) > 0}">
								        	<c:forEach var="item" items="${vocList}" varStatus="status">
                                                <c:if test="${item.re_ok eq 'Y'}">
                                        <tr class="re_Y">
							        			</c:if>
                                                <c:if test="${item.re_ok eq 'N'}">
                                        <tr class="re_N">
							        			</c:if>
                                            <td>${status.index+1}</td>
                                            <td class="tr">
                                                <a href="${pageContext.request.contextPath}/my/vocview/${item.voc_id}">${item.voc_ttl}</a>
                                            </td>
                                            <td>${item.reg_date}</td>
                                                <c:if test="${item.re_ok eq 'Y'}">
                                            <td>${item.re_reg_date}</td>
							        			</c:if>
                                                <c:if test="${item.re_ok eq 'N'}">
                                            <td></td>
							        			</c:if>
                                            <td>
                                                <p class="icon_complete"> 
                                                <c:if test="${item.re_ok eq 'Y'}">
                                                    <span>답변완료</span>
							        			</c:if>
                                                <c:if test="${item.re_ok eq 'N'}">
                                                    <span>접수완료</span>
							        			</c:if>
                                                </p>
                                            </td>
                                        </tr>
								            </c:forEach>
							        	</c:when>
								        <c:otherwise> 
								        <tr>
                                            <td colspan="5">
                                            	아직 접수된 문의가 없습니다. <a href="${pageContext.request.contextPath}/voc" class="c063">(문의 접수하러 가기)</a>
                                            </td>
                                        </tr>
								        </c:otherwise>
								    </c:choose>
                                    </tbody>
                                </table>
                                <!-- 고객의 소리 페이징 -->
                                <div class="suggestion_tbl_pagination">
                                    <ul class="pager">
                                        <li class="active">
                                            <a href="${pageContext.request.contextPath}/">1</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- 고객의 소리 페이징 끝 -->
                            </dd>
                        </dl>
                    </div>
                </section>
                <!-- 고객의 소리 list 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
        <input type="hidden" name="YN_ANSWER" id="YN_ANSWER" value="Y">
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {
        $(document).on("click", ".tab_02", function() {
            $(".tab_01").removeClass("on");
            $(".tab_02").addClass("on");
            $(".tab_03").removeClass("on");
            $(".re_Y").hide();
            $(".re_N").show();
        })

        $(document).on("click", ".tab_03", function() {
            $(".tab_01").removeClass("on");
            $(".tab_02").removeClass("on");
            $(".tab_03").addClass("on");
            $(".re_Y").show();
            $(".re_N").hide();
        })

        $(document).on("click", ".tab_01", function() {
            $(".tab_01").addClass("on");
            $(".tab_02").removeClass("on");
            $(".tab_03").removeClass("on");
            $(".re_Y").show();
            $(".re_N").show();
        })
    })
    </script>
</body>

</html>