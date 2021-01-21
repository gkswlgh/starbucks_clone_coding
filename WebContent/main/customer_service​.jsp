<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>Hello JSP</title>



<!--login css소스파일-->
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="css/style.css?time=<%=System.currentTimeMillis()%>" />
</head>

<body>
	<div id="container">
		<!-- 서브타이틀 -->
		<header class="sub_tit_wrap">
			<div class="sub_tit_bg">
				<div class="sub_tit_inner">
					<h4>
						<img
							src="//image.istarbucks.co.kr/common/img/util/reward/ms_suggestion_ttl.png"
							alt="고객의 소리" />
					</h4>
					<ul class="smap">
						<li><a href="#"><img
								src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png"
								alt="홈으로" /> </a></li>
						<li><img
							src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png"
							class="arrow" alt="하위메뉴" /></li>
						<li><a href="#"><span class="en">고객의 소리</span> </a></li>
					</ul>
				</div>
			</div>
		</header>
		<!-- 서브타이틀 끝 -->
		<!-- 내용 -->
		<form action="" id="vocVO" name="vocForm" class="voc_input_frm"
			method="post" enctype="multipart/form-data">
			<input type="hidden" value="0" id="store_cd" name="store_cd" />
			<fieldset>
				<input type="hidden" name="DC_VISIT_STR" id="CD_VISIT_STR" /> <input
					type="hidden" name="DS_CSTMR_CTTPC" id="DS_CSTMR_CTTPC" /> <input
					type="hidden" name="DS_CSTMR_EMAIL" id="DS_CSTMR_EMAIL" />
				<legend>고객의 소리 입력폼</legend>
				<!-- 인삿말 -->
				<div class="voc_top_bg">
					<div class="voc_top_txt">
						<strong> 귀한 말씀 들려 주십시오. 작은 소리도 듣겠습니다. </strong> <br />
						<p>
							스타벅스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다. <br /> 만족스러운
							서비스였는지, 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다. 보다 나은 서비스로 보답하겠습니다.
						</p>
						<span>고객의 소리 운영시간 : 월~ 일 09:00 ~ 18:00 (연중무휴)</span>
					</div>
					<a href="#" class="btn_ask_list">나의 문의 내역 보기</a>
				</div>
				<!-- 인삿말 끝 -->
				<!-- 테이블 -->
				<div class="voc_input_tbl">
					<p class="must_input">표시 항목은 필수 입력 사항입니다.</p>
					<table summary="분야, 답변 받으실 메일, 연락처, 장소, 제목, 내용">
						<caption>분야, 답변 받으실 메일, 연락처, 장소, 제목, 내용에 대한 테이블</caption>
						<colgroup>
							<col width="200" />
							<col width="630" />
						</colgroup>
						<tbody>
							<tr>
								<th>분야 <img
									src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"
									alt="필수입력" />
								</th>
								<td>
									<div class="sel_wrap">
										<p class="cate_sel_wrap">
											<label for="TP_VOC_DEMAND">문의유형</label>
											<select name="TP_VOC_DEMAND" id="TP_VOC_DEMAND">
												<option value>문의유형</option>
												<option value="01">문의</option>
												<option value="02">칭찬</option>
												<option value="03">제안</option>
												<option value="04">불만</option>
											</select>
										</p>
										<p class="cate_sel_wrap">
											<label for="CD_VOC_CAUSE_1">분류</label>
											<select name="CD_VOC_CAUSE_1" id="CD_VOC_CAUSE_1">
												<option value>분류</option>
												<option value="001">제품/상품</option>
												<option value="002">프로모션/이벤트</option>
												<option value="003">매장</option>
												<option value="004">시스템</option>
												<option value="005">스타벅스 카드</option>
												<option value="006">기타 결제수단</option>
												<option value="007">결제정책/전자영수증</option>
												<option value="008">사이렌오더/e-Gift Item</option>
												<option value="009">스타벅스 딜리버스</option>
												<option value="010">고객경험설문/마이스타벅스리뷰</option>
												<option value="011">스토어케어/고객센터</option>
											</select>
										</p>
									</div>
								</td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
							<tr>
								<th></th>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 테이블 끝 -->
			</fieldset>
		</form>
		<!-- 내용 끝 -->
	</div>
</body>

</html>