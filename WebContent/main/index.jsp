<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>Starbucks Coffee Korea</title>
<!--css소스파일-->
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/slick.css" />
<link rel="stylesheet" type="text/css" href="css/slick-theme.css" />
<link rel="stylesheet" type="text/css"
	href="css/style.css?time=<%=System.currentTimeMillis()%>" />

</head>

<body>
	<!-- 헤더시작 -->
	<div id="header">
		<div class="header_inner">
			<h1 class="logo">
				<a href="#" title="스타벅스 메인페이지">스타벅스 코리아</a>
			</h1>
			<nav class="util_nav">
				<ul class="clear">
					<li class="util_nav01 signIn"><a href="#">Sign In</a></li>
					<li class="util_nav01 signOut" style="display: none;"><a
						href="#">Sign Out</a></li>
					<li class="util_nav02"><a href="#">My Starbucks</a></li>
					<li class="util_nav03"><a href="#">Customer Service &amp;
							Ideas</a></li>
					<li class="util_nav04"><a href="#">Find a Store</a></li>
				</ul>
			</nav>
			<p class="btn_search">
				<a href="#"> <img src="img/icon_magnifier_black.png" alt="통합검색" />
				</a> <label for="totalSearch">통합검색</label> <input type="text"
					id="totalSearch" placeholder="통합검색" />
			</p>
		</div>
		<nav class="gnb_nav">
			<div class="gnb_nav_inner clear">
				<ul class="clear">
					<li class="gnb_nav01">
						<h2>
							<a href="#">COFFEE</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<div class="sub_up clear">
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
									</div>
									<div class="sub_down clear">
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
									<div class="sub_up clear">
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
											<li><a href="#">샌드위치 &amp; 샐러드</a></li>
											<li><a href="#">따뜻한 푸드</a></li>
											<li><a href="#">과일 &amp; 요거트</a></li>
											<li><a href="#">스낵 &amp; 미니 디저트</a></li>
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
									</div>
									<div class="sub_down clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">메뉴 이야기</a></li>
											<li><a href="#">나이트로 콜드브루</a></li>
											<li><a href="#">콜드 브루</a></li>
											<li><a href="#">스타벅스 티바나</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">나이트로 콜드 브루&nbsp;<img
											src="img/icon_gnb_new.png"></a>
									</h3>
									<p class="gnb_sub_ex_txt">나이트로 커피 정통의 물결치듯 흘러내리는 캐스케이딩과
										부드러운 크림을 경험하세요.</p>
								</div>

							</div>
						</div>
					</li>
					<li class="gnb_nav03">
						<h2>
							<a href="#">STORE</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<div class="sub_up clear">
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
									</div>
									<div class="sub_down clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">매장 이야기</a></li>
											<li><a href="#">청담스타</a></li>
											<li><a href="#">티바나 바 매장</a></li>
											<li><a href="#">파미에파크</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">매장찾기</a>
									</h3>
									<p class="gnb_sub_ex_txt">보다 빠르게 매장을 찾아보세요.</p>
									<h3>
										<a href="#">이대R점&nbsp;<img src="img/icon_gnb_new.png"></a>
									</h3>
									<p class="gnb_sub_ex_txt">1호점 특화 MD와 티바나 티, 최고의 리저브 커피를
										만나보세요.</p>
								</div>
							</div>
						</div>

					</li>
					<li class="gnb_nav04">
						<h2>
							<a href="#">RESPONSIBILITY</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<div class="sub_up clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">사회 공헌 캠페인 소개</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">지역 사회 참여 활동</a></li>
											<li><a href="#">희망배달 캠페인</a></li>
											<li><a href="#">재능기부 카페 소식</a></li>
											<li><a href="#">커뮤니티 스토어</a></li>
											<li><a href="#">청년인재 양성</a></li>
											<li><a href="#">우리 농산물 사랑 캠페인</a></li>
											<li><a href="#">우리 문화 지키기</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">환경보호 활동</a></li>
											<li><a href="#">환경 발자국 줄이기</a></li>
											<li><a href="#">일회용 컵 없는 매장</a></li>
											<li><a href="#">커피 원두 재활용</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">윤리 구매</a></li>
											<li><a href="#">윤리적 원두 구매</a></li>
											<li><a href="#">공정무역 인증</a></li>
											<li><a href="#">커피 농가 지원 활동</a></li>
										</ul>
									</div>
									<div class="sub_down clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">글로벌 사회 공헌</a></li>
											<li><a href="#">윤리경영 보고서</a></li>
											<li><a href="#">스타벅스 재단</a></li>
											<li><a href="#">지구촌 봉사의 달</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">커피원두 재활용</a>
									</h3>
									<p class="gnb_sub_ex_txt">스타벅스 커피 원두를 재활용해 보세요.</p>
								</div>
							</div>
						</div>

					</li>
					<li class="gnb_nav05">
						<h2>
							<a href="#">STARBUCKS REWARDS</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<div class="sub_up clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">스타벅스 리워드</a></li>
											<li><a href="#">스타벅스 리워드 소개</a></li>
											<li><a href="#">등급 및 혜택</a></li>
											<li><a href="#">스타벅스 별</a></li>
											<li><a href="#">자주하는 질문</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">스타벅스 카드</a></li>
											<li><a href="#">스타벅스 카드 소개</a></li>
											<li><a href="#">스타벅스 카드 갤러리</a></li>
											<li><a href="#">등록 및 조회</a></li>
											<li><a href="#">충전 및 이용안내</a></li>
											<li><a href="#">분실신고/환불신청</a></li>
											<li><a href="#">자주하는 질문</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">스타벅스 e-Gift Card</a></li>
											<li><a href="#">스타벅스 e-Gift Card 소개</a></li>
											<li><a href="#">이용안내</a></li>
											<li><a href="#">선물하기</a></li>
											<li><a href="#">자주하는 질문</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">스타벅스 카드 등록하기</a>
									</h3>
									<p class="gnb_sub_ex_txt">카드 등록 후 리워드 서비스를 누리고 사용내역도
										조회해보세요.</p>
								</div>
							</div>
						</div>

					</li>
					<li class="gnb_nav06">
						<h2>
							<a href="#">WHAT'S NEW</a>
						</h2>
						<div class="gnb_sub_wrap">
							<div class="gnb_sub">
								<div class="gnb_sub_inner">
									<div class="sub_up clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">프로모션&amp;이벤트</a></li>
											<li><a href="#">전체</a></li>
											<li><a href="#">스타벅스 카드</a></li>
											<li><a href="#">스타벅스 리워드</a></li>
											<li><a href="#">온라인</a></li>
											<li><a href="#">크리스마스 e-프리퀀시 증정품</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">새소식</a></li>
											<li><a href="#">전체</a></li>
											<li><a href="#">상품 출시</a></li>
											<li><a href="#">스타벅스와 문화</a></li>
											<li><a href="#">스타벅스 사회공헌</a></li>
											<li><a href="#">스타벅스 카드출시</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">매장별 이벤트</a></li>
											<li><a href="#">일반 매장</a></li>
											<li><a href="#">신규 매장</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">e-프리퀀시</a></li>
											<li><a href="#">이용안내</a></li>
											<li><a href="#">이용현황</a></li>
										</ul>
									</div>
									<div class="sub_down clear">
										<ul>
											<li class="gnb_sub_ttl"><a href="#">공지사항</a></li>
										</ul>
										<ul>
											<li class="gnb_sub_ttl"><a href="#">월페이퍼</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="gnb_sub_txbg">
								<div class="gnb_sub_tx_inner">
									<h3>
										<a href="#">매장별 이벤트</a>
									</h3>
									<p class="gnb_sub_ex_txt">스타벅스의 매장 이벤트 정보를 확인 하실 수 있습니다.</p>
									<h3>
										<a href="#">월페이퍼</a>
									</h3>
									<p class="gnb_sub_ex_txt">매월 업데이트되는 월페이퍼(PC/Mobile)로 스타벅스를
										더욱 가깝게 즐겨보세요!</p>
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
			<div class="xmas">
				<a href="#" title="자세히 보기"> <img src="img/ssg_pop.png"
					alt="11월 25일 스타벅스 온라인 샵 런칭!" />
				</a>
			</div>
			<div class="plcc">
				<a href="#" title="자세히 보기"> <img src="img/plcc_badge.png"
					alt="스타벅스 현대카드" />
				</a>
			</div>
		</div>
		<!-- 플로팅 배너 끝 -->

	</div>
	<!-- 내용 끝 -->

	<!-- 푸터시작 -->
	<div id="footer">
		<div class="footer_menus">
			<div class="footer_menus_inner">
				<div class="menus_up clear">
					<ul>
						<li class="footer_menu_ttl"><a href="#" class="en">COMPANY</a></li>
						<li><a href="#">한눈에 보기</a></li>
						<li><a href="#">스타벅스 사명</a></li>
						<li><a href="#">스타벅스 소개</a></li>
						<li><a href="#">국내 뉴스룸</a></li>
						<li><a href="#">세계의 스타벅스</a></li>
						<li><a href="#">글로벌 뉴스룸</a></li>
					</ul>
					<ul>
						<li class="footer_menu_ttl"><a href="#" class="en">CORPORATE
								SALES</a></li>
						<li><a href="#">단체 및 기업 구매 안내</a></li>
					</ul>
					<ul>
						<li class="footer_menu_ttl"><a href="#" class="en">PARTNERSHIP</a></li>
						<li><a href="#">신규 입점 제의</a></li>
						<li><a href="#">협력 고객사 등록신청</a></li>
					</ul>
				</div>
				<div class="menus_down clear">
					<ul>
						<li class="footer_menu_ttl"><a href="#" class="en">ONLINE
								COMMUNITY</a></li>
						<li><a href="#">페이스북</a></li>
						<li><a href="#">트위터</a></li>
						<li><a href="#">유튜브</a></li>
						<li><a href="#">블로그</a></li>
						<li><a href="#">인스타그램</a></li>
					</ul>
					<ul>
						<li class="footer_menu_ttl"><a href="#" class="en">RECRUIT</a></li>
						<li><a href="#">채용 소개</a></li>
						<li><a href="#">채용 지원하기</a></li>
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
							<li><a href="#"><img
									src="img/footer/footer_award17_01.jpg"
									alt="고용노동부 2016년 고용창출 100개 우수기업 4년 연속 표창" /></a></li>
							<li><a href="#"><img
									src="img/footer/footer_award17_02.jpg"
									alt="고용노동부 2016년 장애인고용촉진대회 장애인고용촉진 유공 포상" /></a></li>
							<li><a href="#"><img
									src="img/footer/footer_award17_03.jpg"
									alt="환경부 2016년 그린킹 캠페인 온실가스 저감 우수 모범 기업" /></a></li>
							<li><a href="#"><img
									src="img/footer/footer_award17_04.jpg"
									alt="농림축산식품부 2016년 농식품 상생협력 활동 우수사례 기업" /></a></li>
							<li><a href="#"><img
									src="img/footer/footer_award17_05.jpg"
									alt="2016년 대한민국 여성인재경영대상 우수사례 기업" /></a></li>
							<li><a href="#"><img
									src="img/footer/footer_award17_06.jpg"
									alt="2016년 한국 최고의 직장 톱10 본상" /></a></li>
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
				<ul class="terms">
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">영상정보처리기기 운영관리 방침</a></li>
					<li><a href="#">홈페이지 이용약관</a></li>
					<li><a href="#">위치정보 이용약관</a></li>
					<li><a href="#">스타벅스 카드 이용약관</a></li>
					<li><a href="#">비회원 이용약관</a></li>
					<li><a href="#">My DT Pass 서비스 이용약관</a></li>
					<li><a href="#">윤리경영 핫라인</a></li>
				</ul>
				<ul class="link_btn">
					<li><a href="#">찾아오시는 길</a></li>
					<li><a href="#">신규입점제의</a></li>
					<li><a href="#">사이트 맵</a></li>
				</ul>
				<ul class="copy">
					<li>사업자등록번호 : 201-81-21515</li>
					<li>(주)스타벅스커피 코리아 대표이사 : 송 데이비드 호섭</li>
					<li>TEL : 1522-3232</li>
					<li>개인정보 책임자 : 장석현</li>
				</ul>
				<address class="copy_en en">&copy; 2020 Starbucks Coffee
					Company. All Rights Reserved.</address>
			</div>
		</aside>
	</div>
	<!-- 푸터끝 -->
	<!-- js소스파일:jQuery -->
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="js/header.js?time=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript" src="js/slick.min.js"></script>
	<script src="js/footer.js?time=<%=System.currentTimeMillis()%>"></script>
</body>

</html>