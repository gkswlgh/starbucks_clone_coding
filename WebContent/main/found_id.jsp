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
	<div class="find_mem_wrap">
		<div class="find_mem_inner">
			<div class="find_mem_ttl">아이디 찾기</div>
			<div class="find_mem_form">
				<div class="find_mem_result">
					<div class="find_mem_sally"></div>
					<div class="mem_result_txt">
						<strong>아이디가 기억나지 않으세요?</strong>
						<span class="result_txt_sub">아래 인증 방법을 통해 아이디를 확인 하실 수 있습니다.</span>
					</div>
				</div>
				<div class="find_mem_name bd_none">
					<strong>이메일 주소로 아이디 찾기</strong>
					
				</div>
			</div>
		</div>
	</div>
<body>
	
</body>

</html>