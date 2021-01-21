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
	<div class="login_bg_wrap">
		<div class="login_wrap">
			<div class="login_inner">
				<form id="login" action="" method="post">
					<fieldset>
						<legend class="hid">로그인 폼</legend>
						<strong class="login_ttl">로그인</strong>
						<section class="login_form">
							<p class="find_form_txt">
								<span class="t_006633">Welcome!</span> 스타벅스커피 코리아에 오신 것을 환영합니다.
							</p>
							<div class="login_input_box bd_none">
								<label for="txt_user_id" class="hid">아이디</label> <input
									type="text" class="login_id mb10" id="txt_user_id"
									name="user_id" placeholder="아이디를 입력해주세요." maxlength="20"
									required="required" /> <label for="txt_user_pw" class="hid">비밀번호</label>
								<input type="password" class="login_pw mb10" id="txt_user_pw"
									name="user_pw" placeholder="비밀번호를 입력해 주세요." maxlength="20"
									required="required" autocomplete="off" /> <span
									class="checkWrap"> <input type="checkbox" name="idRemb"
									id="idRemb" class="mem2" /> <label for="idRemb">아이디 저장</label>
								</span>
								<p class="btn_mem_login">
									<a href="#" class="login_btn" role="submit">로그인</a>
								</p>
								<p class="input_warn_text t_006633">
									* 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길
									바랍니다. <br /> * 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상,
									Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
								</p>
							</div>
							<div class="login_btn_wrap">
								<ul>
									<li><a href="#">회원가입</a></li>
									<li><a href="#">아이디 찾기</a></li>
									<li class="last"><a href="#">비밀번호 찾기</a></li>
								</ul>
							</div>
						</section>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>

</html>