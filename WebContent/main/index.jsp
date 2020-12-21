<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>Hello JSP</title>
<!--css소스파일-->
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
	<!-- 헤더시작 -->
	<div id="header">
		<div class="header_inner">
			<h1 class="logo">
				<a href="/" title="스타벅스 메인페이지">스타벅스 코리아</a>
			</h1>
			<nav class="util_nav">
				<ul>
					<li class="util_nav01 signIn"><a href="#">Sign In</a></li>
					<li class="util_nav01 signOut" style="display: none;"><a
						href="#">Sign Out</a></li>
					<li class="util_nav02"><a href="#">My Starbucks</a></li>
					<li class="util_nav03"><a href="#">Customer Service &
							Ideas</a></li>
					<li class="util_nav04"><a href="#">Find a Store</a></li>
				</ul>
			</nav>
			<div class="search">
				<a href="#"><img src="img/icon_magnifier_black.png" alt="통합검색" /></a>
				<label for="totalSearch">통합검색</label> <input type="text"
					id="totalSearch" placeholder="통합검색" />
			</div>
		</div>
		<nav class="gnb_nav">
			<div class="gnb_nav_inner">
				<ul>
					<li class="gnb_nav01">
						<h2>
							<a href="#">COFFEE</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<ul>
										<li class="gnb_sub_ttl"><a href="#">커피</a></li>
										<li><a href="#">스타벅스 원두</a></li>
										<li><a href="#">스타벅스 비아</a></li>
										<li><a href="#">스타벅스 오리가미</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">나와 어울리는 커피</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">스타벅스 리저브™</a></li>
										<li><a href="#">RESERVE MAGAZINE</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">에스프레소 음료</a></li>
										<li><a href="#">도피오</a></li>
										<li><a href="#">에스프레소 마키아또</a></li>
										<li><a href="#">아메리카노</a></li>
										<li><a href="#">마키아또</a></li>
										<li><a href="#">카푸치노</a></li>
										<li><a href="#">라떼</a></li>
										<li><a href="#">모카</a></li>
										<li><a href="#">리스트레또 비안코</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">최상의 커피를 즐기는 법</a></li>
										<li><a href="#">커피 프레스</a></li>
										<li><a href="#">푸어 오버</a></li>
										<li><a href="#">아이스 푸어 오버</a></li>
										<li><a href="#">커피 메이커</a></li>
										<li><a href="#">리저브를 매장에서 다양하게 즐기는 법</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">커피 이야기</a></li>
										<li><a href="#">스타벅스 로스트 스팩트럼</a></li>
										<li><a href="#">최상의 아라비카 원두</a></li>
										<li><a href="#">한 잔의 커피가 완성되기까지</a></li>
										<li><a href="#">클로버® 커피 추출 시스템</a></li>
										<li><a href="#">스타벅스 디카페인</a></li>
									</ul>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">나와 어울리는 커피 찾기</a>
									</h3>
									<p class="gnb_sub_ex_txt">스타벅스가 여러분에게 어울리는 커피를 찾아드립니다.</p>
									<h3>
										<a href="#">최상의 커피를 즐기는 법</a>
									</h3>
									<p class="gnb_sub_ex_txt">여러가지 방법을 통해 다양한 풍미의 커피를 즐겨보세요.</p>
								</div>
							</div>
						</div>
					</li>
					<li class="gnb_nav02">
						<h2>
							<a href="#">MENU</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<ul>
										<li class="gnb_sub_ttl"><a href="#">음료</a></li>
										<li><a href="#">콜드브루</a></li>
										<li><a href="#">브루드 커피</a></li>
										<li><a href="#">에스프레소</a></li>
										<li><a href="#">프라푸치노</a></li>
										<li><a href="#">블렌디드</a></li>
										<li><a href="#">스타벅스 피지오</a></li>
										<li><a href="#">티(티바나)</a></li>
										<li><a href="#">기타 제조 음료</a></li>
										<li><a href="#">스타벅스 주스(병음료)</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">푸드</a></li>
										<li><a href="#">브레드</a></li>
										<li><a href="#">케이크</a></li>
										<li><a href="#">샌드위치 & 샐러드</a></li>
										<li><a href="#">따뜻한 푸드</a></li>
										<li><a href="#">과일 & 요거트</a></li>
										<li><a href="#">스낵 & 미니 디저트</a></li>
										<li><a href="#">아이스크림</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">상품</a></li>
										<li><a href="#">머그</a></li>
										<li><a href="#">글라스</a></li>
										<li><a href="#">플라스틱 텀블러</a></li>
										<li><a href="#">스테인리스 텀블러</a></li>
										<li><a href="#">보온병</a></li>
										<li><a href="#">액세서리</a></li>
										<li><a href="#">커피 용품</a></li>
										<li><a href="#">패키지 티(티바나)</a></li>
										<li><a href="#">스타벅스 플래너</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">카드</a></li>
										<li><a href="#">실물카드</a></li>
										<li><a href="#">e-Gift 카드</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">메뉴 이야기</a></li>
										<li><a href="#">나이트로 콜드브루</a></li>
										<li><a href="#">콜드 브루</a></li>
										<li><a href="#">스타벅스 티바나</a></li>
									</ul>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">나이트로 콜드 브루<img src="img/icon_gnb_new.png"></a>
									</h3>
									<p class="gnb_sub_ex_txt">나이트로 커피 정통의 물결치듯 흘러내리는 캐스케이딩과
										부드러운 크림을 경험하세요.</p>
								</div>
							</div>
						</div>
					</li>
					<li class="gnb_nav02">
						<h2>
							<a href="#">MENU</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<ul>
										<li class="gnb_sub_ttl"><a href="#">매장 찾기</a></li>
										<li><a href="#">퀵 검색</a></li>
										<li><a href="#">지역 검색</a></li>
										<li><a href="#">My 매장</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">드라이브 스루 매장</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">스타벅스 리저브™ 매장</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">커뮤니티 스토어 매장</a></li>
									</ul>
									<ul>
										<li class="gnb_sub_ttl"><a href="#">매장 이야기</a></li>
										<li><a href="#">청담스타</a></li>
										<li><a href="#">티바나 바 매장</a></li>
										<li><a href="#">파미에파크</a></li>
									</ul>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">매장찾기</a>
									</h3>
									<p class="gnb_sub_ex_txt">보다 빠르게 매장을 찾아보세요.</p>
									<h3>
										<a href="#">이대R점<img src="img/icon_gnb_new.png"></a>
									</h3>
									<p class="gnb_sub_ex_txt">1호점 특화 MD와 티바나 티, 최고의 리저브 커피를 만나보세요.</p>
								</div>
							</div>
						</div>
					</li>

				</ul>
			</div>
		</nav>
	</div>
	<!-- 헤더끝 -->

	<!-- 내용 시작 -->
	<div id="contents">

		<!-- 플로팅 배너 시작 -->
		<div class="f_banner">
			<div class="xmas"></div>
			<div class="plcc"></div>
		</div>
		<!-- 플로팅 배너 끝 -->

	</div>
	<!-- 내용 끝 -->

	<!-- 푸터시작 -->
	<div id="footer"></div>
	<!-- 푸터끝 -->
</body>

</html>