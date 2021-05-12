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
                        <li><a href="${pageContext.request.contextPath}/mypage"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/order_list"><span class="en">전자영수증</span></a></li>
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
                    <form action="${pageContext.request.contextPath}/my/order_list" method="get">
                        <fieldset>
                            <legend>검색 조건 선택 폼</legend>
                            <dl class="my_card_pick_bg">
                                <dt style="width:300px;">검색 조건 | <span style="font-size:12px;color:#aaa;">&nbsp;선택 후 검색 버튼을 눌러주세요.</span></dt>
                            </dl>
                            <dl class="my_card_pick_date">
                                <dt>일자별</dt>
                                <dd>
                                    <input type="date" id="pickDate01" name="pickDate01" title="원하는 날짜를 선택해 주세요." value="${pick_date01}" >
                                    <p class="hyphen_bg"></p>
                                    <input type="date" id="pickDate02" name="pickDate02" title="원하는 날짜를 선택해 주세요." value="${pick_date02}" >
                                    <p class="btn_pick_date">
                                        <button type="submit">검색</button>
                                    </p>
                                </dd>
                            </dl>
                            <div class="my_card_pick_date2 clear">
                                <dl>
                                    <dt>결제수단</dt>
                                    <dd>
                                        <div class="select_box">
                                            <select id="pay_method" name="pay_method">
                                                <option value="0">전체보기</option>
                                                <option value="S" <c:if test="${pay_method == 'S'}">selected</c:if> >스타벅스 카드</option>
                                                <option value="N" <c:if test="${pay_method == 'N'}">selected</c:if> >스타벅스 카드 외</option>
                                            </select>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>거래유형</dt>
                                    <dd>
                                        <div class="select_box">
                                            <select id="order_type" name="order_type">
                                                <option value="0">전체보기</option>
                                                <option value="1" <c:if test="${order_type == '1'}">selected</c:if> >충전</option>
                                                <option value="2" <c:if test="${order_type == '2'}">selected</c:if> >주문</option>
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
                        <col width="60">
                        <col width="125">
                        <col width="152">
                        <col width="80">
                        <col width="165">
                        <col width="90">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="en" scope="col">No</th>
                            <th scope="col">거래구분</th>
                            <th scope="col">결제수단</th>
                            <th scope="col">주소</th>
                            <th scope="col">금액</th>
                            <th scope="col">날짜</th>
                            <th scope="col">상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
          <c:choose>
	        <c:when test="${output != null && fn:length(output) > 0}">
				<c:forEach var="item" items="${output}" varStatus="status">
                        <tr>
                            <td>
                        	<c:if test="${status.index+1 < 10}">${pageData.nowPage-1}${status.index+1}</c:if>
                        	<c:if test="${status.index+1 == 10}">${pageData.nowPage}0</c:if>
                        	</td>
                            <td>
								<c:if test="${item.order_type == '1'}">충전</c:if>
								<c:if test="${item.order_type == '2'}">주문</c:if>
							</td>
                            <td>
								<c:if test="${item.pay_method == 'S'}">스타벅스 카드</c:if>
								<c:if test="${item.pay_method == 'N'}">신용카드 결제</c:if>
							</td>
                            <td> 
                            <div style="width:150px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;" title="${item.addr1} &nbsp; ${item.addr2}">${item.addr1} &nbsp; ${item.addr2}</div>
                            </td>
                            <td><fmt:formatNumber value="${item.order_price}" pattern="#,###" /></td>
                            <td>${item.reg_date}</td>
                            <td style="padding:0px;position:relative;">
                            <c:if test="${item.order_type == '2'}">
                            	<p class="btn_pick_date" style="position:absolute;top:10px;left:20px;">
                                   <a href="${pageContext.request.contextPath}/my/order_view/${item.order_id}">상세</a>
                                </p>
                            </c:if>
                           </td>
                        </tr>
			  </c:forEach>
              </c:when>
              <c:otherwise>
		              <tr>
		              	<td colspan="7">주문 내역이 존재하지 않습니다.</td>
		              </tr>
              </c:otherwise>
            </c:choose>
                    </tbody>
                </table>
                <!-- 카드내역표 끝 -->
                
                <!-- 페이지 번호 구현 -->
                <div class="egiftCard_tbl_pagination">
				<ul class="pager">
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/my/order_list" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
						</c:url>
						<li class="active"><a href="${prevPageUrl}">이전 &nbsp;|&nbsp;</a></li>
					</c:when>
					<c:otherwise>
			    		<li class="active">이전 &nbsp;|&nbsp;</li>
			    	</c:otherwise>
				</c:choose>
			
				<%-- 페이지 번호 (그룹 시작페이지 ~ 끝페이지 를 반복) --%>
				<c:forEach var="i" begin="${pageData.startPage}"
					end="${pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/my/order_list" var="pageUrl">
						<c:param name="page" value="${i}" />
					</c:url>
			
					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${pageData.nowPage == i}">
							<li class="active">${i}</li>
						</c:when>
						<%-- 나머지 페이지의 경우 링크 적용함 --%>
						<c:otherwise>
							<li class="active"><a href="${pageUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			
				<%-- 다음 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.nextPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/my/order_list" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
						</c:url>
						<li class="active"><a href="${nextPageUrl}">&nbsp;| &nbsp;다음</a></li>
					</c:when>
					<c:otherwise>
			    		<li class="active">&nbsp;| &nbsp;다음</li>
			    	</c:otherwise>
				</c:choose>
				</ul>
				</div>
                <!-- 페이지번호구현 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>