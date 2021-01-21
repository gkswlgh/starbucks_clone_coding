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
	<div class="find_mem_wrap">
		<div class="find_mem_inner">
			<form id="find_mem" action="" method="post">
				<fieldset>
					<legend class="hid">회원 개인정보를 조회하는 폼</legend>
					<div class="find_mem_ttl">비밀번호 찾기</div>
					<section class="find_mem_form">
						<div class="find_mem_result">
							<div class="find_mem_sally"></div>
							<div class="mem_result_txt">
								<strong>비밀번호가 기억나지 않으세요?</strong> <span class="result_txt_sub">아래
									인증 방법을 통해 비밀번호를 변경 하실 수 있습니다.</span>
							</div>
						</div>
						<div class="find_mem bd_none">
							<strong>이메일 인증하여 비밀번호 찾기</strong>
							<div class="find_mem_input_box bd_none">
								<label for="txt_user_id" class="hid">아이디</label> <input
									type="text" class="find_mem_input_txt mb10" id="txt_user_id"
									name="user_id" placeholder="아이디를 입력해주세요." maxlength="20"
									required="required" /> <label for="txt_user_email" class="hid">이메일</label>
								<input type="text" class="find_mem_input_txt mb10"
									id="txt_user_email" name="user_email"
									placeholder="이메일을 입력해 주세요." maxlength="20" required="required" />
								<p class="btn_find_mem">
									<a href="#" role="submit">이메일로 인증번호 보내기</a>
								</p>
								<p class="input_warn_text t_006633">존재하지 않는 회원 아이디 혹은 이메일입니다.
								</p>
							</div>
						</div>
					</section>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>