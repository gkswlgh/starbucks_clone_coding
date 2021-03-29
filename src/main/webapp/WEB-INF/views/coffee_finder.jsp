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
        <header class="sub_tit_wrap sub_tit_wrap_short">
            <div class="sub_tit_bg_white">
                <div class="sub_tit_inner_short">
                    <h2>
                        <img src="//image.istarbucks.co.kr/common/img/coffee/coffee_productFinder_tit1.jpg" alt="나와 어울리는 커피" />
                    </h2>
                    <p class="coffee_sub_tit">여러분에게 잘 맞는 커피를 찾기 위한 3가지 질문입니다.</p>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en c222">COFFEE</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en c222">나와 어울리는 커피</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="wrapper">
            <div class="find_wrap">
                <div class="find_inner">
                    <div class="find_section find_section1">
                        <p class="find_con find_con1">
                            <img src="//image.istarbucks.co.kr/common/img/coffee/taste_find_ttl1.png" alt="1. 어떤 풍미에 가장 끌리세요? 가장 좋아하는 음식을 생각해보세요. 그 음식의 어떤 풍미와 재료에 끌리나요?">
                        </p>
                        <ul class="find_taste find_taste01 clear">
                            <li class="ft_t01">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_TASTE1.value = 10;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste1_1.png" alt></a>
                                    </dt>
                                    <dd>짭짤한 맛</dd>
                                </dl>
                            </li>
                            <li class="ft_t02">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_TASTE1.value = 20;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste1_2.png" alt></a>
                                    </dt>
                                    <dd>과일 맛</dd>
                                </dl>
                            </li>
                            <li class="ft_t03">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_TASTE1.value = 30;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste1_3.png" alt></a>
                                    </dt>
                                    <dd>구운 맛</dd>
                                </dl>
                            </li>
                            <li class="ft_t04 last">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_TASTE1.value = 40;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste1_4.png" alt></a>
                                    </dt>
                                    <dd>달콤한(캐러멜) 맛</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="find_section find_section2">
                        <p class="find_con find_con2">
                            <img src="//image.istarbucks.co.kr/common/img/coffee/taste_find_ttl2.png" alt="2. 어떤 느낌을 좋아하세요? 느낌이란 커피가 혀와 입천장에 닿았을 때 느껴지는 느낌을 말합니다.">
                        </p>
                        <ul class="find_taste find_taste02 clear">
                            <li class="ft2_t01">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_FEEL.value = 10;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste2_1.png" alt></a>
                                    </dt>
                                    <dd>상쾌한 느낌</dd>
                                </dl>
                            </li>
                            <li class="ft2_t02">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_FEEL.value = 20;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste2_2.png" alt></a>
                                    </dt>
                                    <dd>부드러운 느낌</dd>
                                </dl>
                            </li>
                            <li class="ft2_t03 last">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="document.frm.COFFEE_FEEL.value = 30;"><img src="//image.istarbucks.co.kr/common/img/coffee/taste2_3.png" alt></a>
                                    </dt>
                                    <dd>오랫동안 여운이 남는 느낌</dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="find_section find_section3">
                        <p class="find_con find_con3">
                            <img src="//image.istarbucks.co.kr/common/img/coffee/taste_find_ttl3.png" alt="3. 어느 정도의 강도를 원하세요? 강도란 커피의 로스트와 풍미의 정도를 말합니다.">
                        </p>
                        <ul class="find_taste find_taste03 clear">
                            <li class="ft3_t01">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="i.goSubmit(10)"><img src="//image.istarbucks.co.kr/common/img/coffee/taste3_1.png" alt></a>
                                    </dt>
                                    <dd>은은하고 부드러움
                                    </dd>
                                </dl>
                            </li>
                            <li class="ft3_t02">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="i.goSubmit(20)"><img src="//image.istarbucks.co.kr/common/img/coffee/taste3_2.png" alt></a>
                                    </dt>
                                    <dd>미디엄으로 균형 잡힘
                                    </dd>
                                </dl>
                            </li>
                            <li class="ft3_t03 last">
                                <dl>
                                    <dt>
                                        <a href="javascript:void(0)" onclick="i.goSubmit(30)"><img src="//image.istarbucks.co.kr/common/img/coffee/taste3_3.png" alt></a>
                                    </dt>
                                    <dd>강도가 세고 강렬함
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
    <!-- 폼 -->
    <form action="productFinderView.do" name="frm" id="frm" method="POST" onsubmit="return false;">
        <input type="hidden" name="COFFEE_TASTE1">
        <input type="hidden" name="COFFEE_FEEL">
        <input type="hidden" name="COFFEE_INTEN">
    </form>
    <!-- 폼 끝 -->
    <!-- 사용자 자바스크립트 -->
    <script type="text/javascript">
    var i = {
        goSubmit: function(inten) {
            document.frm.COFFEE_INTEN.value = inten;
            document.frm.submit();
        }
    }
    </script>
</body>

</html>