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
                        <img src="//image.istarbucks.co.kr/common/img/search/total_search_ttl.png" alt="통합 검색" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">통합검색</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="wrapper">
            <div class="inner">
                <!-- 통합검색 입력 -->
                <fieldset>
                    <legend class="hid">통합검색 입력</legend>
                    <div class="search_input_wrap">
                        <strong>원하시는 검색어를 입력하신 후 검색 버튼을 클릭하세요.</strong>
                        <div class="search_input">
                            <input type="text" name="search" id="search" /> <a href="${pageContext.request.contextPath}/" class="search_btn">검색</a>
                        </div>
                        <div class="search_btns">
                            <ul>
                                <li class="total_search_btn1"><input type="checkbox" id="search_all"><label class="category_set_btn on" for="search_all">통합검색</label></li>
                                <li class="total_search_btn2"><input type="checkbox" id="search_coffee"><label for="search_coffee" class="category_set_btn">원두</label></li>
                                <li class="total_search_btn3"><input type="checkbox" id="search_drink"><label class="category_set_btn" for="search_drink">음료</label></li>
                            </ul>
                        </div>
                    </div>
                </fieldset>
                <p class="sch_no_result">검색 결과가 없습니다.</p>
                <!-- 통합검색 입력 끝 -->
                <!-- 커피 -->
                <section class="contents_wrap card_search_result search_coffee">
                    <header class="search_result_each_ttl">
                        <h2>원두</h2>
                        <a href="${pageContext.request.contextPath}/">원두 더보기</a>
                    </header>
                    <ul class="search_coffee_wrap">
                        <li>
                            <figure>
                                <img src="//image.istarbucks.co.kr//upload/store/skuimg/2015/08/[11019857]_20150809121431365.jpg" alt>
                            </figure>
                            <div class="card_search_result_txt">
                                <header>
                                    <h3 class="rt_title">
                                        <span class="yellow_bg">콜롬비아</span>250g (Colombia 250g)
                                    </h3>
                                </header>
                                <p class="card_search_result_cont rt_text">
                                    견과류의 풍미를 간직한 부드럽고 균형 잡힌 커피
                                </p>
                                <p class="card_search_result_link">
                                    <a href="${pageContext.request.contextPath}/" class="en" target="_blank">
                                        http://www.starbucks.co.kr/coffee/product_view.do?PRODUCT_CD=11019857
                                    </a>
                                </p>
                            </div>
                        </li>
                        <li>
                            <figure>
                                <img src="//image.istarbucks.co.kr//upload/store/skuimg/2015/08/[11019857]_20150809121431365.jpg" alt>
                            </figure>
                            <div class="card_search_result_txt">
                                <header>
                                    <h3 class="rt_title">
                                        <span class="yellow_bg">콜롬비아</span>250g (Colombia 250g)
                                    </h3>
                                </header>
                                <p class="card_search_result_cont rt_text">
                                    견과류의 풍미를 간직한 부드럽고 균형 잡힌 커피
                                </p>
                                <p class="card_search_result_link">
                                    <a href="${pageContext.request.contextPath}/" class="en" target="_blank">
                                        http://www.starbucks.co.kr/coffee/product_view.do?PRODUCT_CD=11019857
                                    </a>
                                </p>
                            </div>
                        </li>
                    </ul>
                </section>
                <!-- 커피 끝 -->
                <!-- 음료 -->
                <section class="contents_wrap bev_search_result search_drink">
                    <header class="search_result_each_ttl">
                        <h2>음료</h2>
                        <a href="${pageContext.request.contextPath}/">음료 더보기</a>
                    </header>
                    <ul class="search_drink_wrap">
                        <li>
                            <p class="sch_no_result_subtap">검색 결과가 없습니다.</p>
                        </li>
                    </ul>
                </section>
                <!-- 음료 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
    <script type="text/javascript">
    // 카테고리 상세보기 선택 버튼
    $(document).on("change", ".search_btns > ul > li > input", function() {

        if ($(this).next().hasClass('on')) {
            $(".search_btns>ul>li>label").removeClass("on");
            $("#search_all").next().addClass("on");
            // 상품분류 선택하면 리스트 아래에 바로 출력되도록 (ajax?)
        } else {
            $(".search_btns>ul>li>label").removeClass("on");
            $(this).next().addClass("on");
            // 상품분류 선택하면 리스트 아래에 바로 출력되도록
        }
        return false;
    });
    </script>
</body>

</html>