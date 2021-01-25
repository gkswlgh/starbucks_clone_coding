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
								alt="홈으로" /></a></li>
						<li><img
							src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png"
							class="arrow" alt="하위메뉴" /></li>
						<li><a href="#"><span class="en">고객의 소리</span></a></li>
					</ul>
				</div>
			</div>
		</header>
		<!-- 서브타이틀 끝 -->
		<!-- 내용 -->
		<div class="cont">
			<div class="cont_inner">
				<form action="#" id="vocVO" name="vocForm" class="voc_input_frm"
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
									<col width="740" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">분야 <img
											src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"
											alt="필수입력" />
										</th>
										<td>
											<div class="sel_wrap">
												<p class="cate_sel_wrap">
													<label for="TP_VOC_DEMAND">문의유형</label> <select
														name="TP_VOC_DEMAND" id="TP_VOC_DEMAND">
														<option value>문의유형</option>
														<option value="01">문의</option>
														<option value="02">칭찬</option>
														<option value="03">제안</option>
														<option value="04">불만</option>
													</select>
												</p>
												<p class="cate_sel_wrap">
													<label for="CD_VOC_CAUSE_1">분류</label> <select
														name="CD_VOC_CAUSE_1" id="CD_VOC_CAUSE_1">
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
										<th scope="row">답변 받으실 메일 <img
											src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"
											alt="필수입력" /></th>
										<td>
											<div class="sel_wrap">
												<input type="text" class="mail_input" id="DS_CSTMR_EMAIL1"
													name="DS_CSTMR_EMAIL1" />
												<p class="mail_at">@</p>
												<input type="text" id="DS_CSTMR_EMAIL2" class="mail_input" />
												<p class="mail_sel_wrap">
													<label for="mail">직접입력</label> <select id="mail">
														<option selected="selected" value>직접입력</option>
														<option value="hotmail.com">hotmail.com</option>
														<option value="yahoo.co.kr">yahoo.co.kr</option>
														<option value="hanmir.com">hanmir.com</option>
														<option value="naver.com">naver.com</option>
														<option value="empal.com">empal.com</option>
														<option value="hitel.net">hitel.net</option>
														<option value="netian.com">netian.com</option>
														<option value="nate.com">nate.com</option>
														<option value="korea.com">korea.com</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="freechal.com">freechal.com</option>
														<option value="lycos.co.kr">lycos.co.kr</option>
														<option value="gmail.com">gmail.com</option>
													</select>
												</p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											<div class="sel_wrap">
												<p class="phone_sel_wrap">
													<label for="phone1">010</label> <select id="phone1">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="109">019</option>
													</select>
												</p>
												<p class="cell_hyphen">-</p>
												<input type="text" class="cellphone_input" id="phone2"
													name="phone2" maxlength="4" ref="num" />
												<p class="cell_hyphen">-</p>
												<input type="text" class="cellphone_input" id="phone3"
													name="phone3" maxlength="4" ref="num" />
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">장소 <img
											src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"
											alt="필수입력" /></th>
										<td>
											<div class="tbl_radio_wrap">
												<input  id="HOW1" name="how" checked="checked"
													type="radio" value="Y" /> <label for="HOW1">매장 방문</label>
												<input  id="HOW2" name="how" checked="checked"
													type="radio" value="N" /> <label for="HOW2">매장 방문
													외</label>
											</div>
											<div class="sel_wrap mt10">
												<p class="visit_txt">방문매장</p>
												<input type="text" id="VISIT" class="visit_input"
													placeholder="지점명을 적어주세요." />
											</div>
											<div class="sel_wrap mt10">
												<p class="visit_txt">방문일</p>
												<input type="text" id="VISIT_DATE" class="visit_input"
													placeholder="2020-04-13의 형식으로 적어주세요" />
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">제목 <img
											src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"
											alt="필수입력" /></th>
										<td>
											<div class="sel_wrap">
												<input type="text" class="voc_ttl_input1" id="DS_VOC_TITLE"
													name="DS_VOC_TITLE" onpaste="fnPaste(); return false;"
													oncopy="fnCopy(); return false;" />
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">내용 <img
											src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif"
											alt="필수입력" /></th>
										<td><textarea class="textArea" name="DS_VOC_CN"
												id="DS_VOC_CN" onpaste="fnPaste(); return false;"
												oncopy="fnCopy(); return false;"
												placeholder="관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보 보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다."></textarea>
											<br /> <span id="realByte">0 / 2500byte</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 테이블 끝 -->
						<div class="voc_info_input_guide">
							<ul>
								<li>본 고객의 소리는 e-mail을 통한 상담으로만 진행됩니다. 전화 상담 요청은 불가하오니 양해 부탁
									드립니다.</li>
								<li>고객이 동의한 개인정보처리방침에 따라 고객의 소리 민원 처리를 위해 작성자의 개인정보를 활용할 수
									있습니다.</li>
								<li>답변은 직접 기재하여 주신 메일주소로 발송되며, 기재 오류 및 계정문제가 발생한 경우에는 답변이
									불가할 수 있으므로 메일 주소를 꼭 확인해 주시기 바랍니다.</li>
								<li>관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보보안, 불충분한 증거/귀책 사유에
									대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지
									않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다.</li>
								<li>공정거래위원회에서 고시한 소비자분쟁해결기준에 의거 소비자 피해에 대한 교환/환불 처리 해드립니다.</li>
							</ul>
						</div>
						<div class="voc_info_input_btn1">
							<a href="#none" onclick="자바스크립트함수(); return false;">고객의 소리 등록
								하기</a>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<!-- 내용 끝 -->
	</div>
</body>

</html>