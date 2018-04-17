<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛있는 발견의 즐거움 - Fooding</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/common.css">
<style>
button {
	margin: 20px;
	width: 390px;
	height: 47px;
	background: #ff5a5f;
}

#forgot_password { 
	width: 440px;
	height: 555px;
	background-color: white;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

#forgot_password>.body>.description {
	font-size: 14px;
	color: #646464;
	margin-top: 22px;
	margin-bottom: 31px;
	text-align: center;
	line-height: 20px;
}

#email {
	
}

input {
	width: 390px;
	height: 47px;
	border: 1px solid #CCCCCC;
	padding-left: 10px;
}

#forgot_password>.body>form>.notice {
	font-size: 11px;
	color: #969696;
	margin-top: 5px;
	margin-bottom: 36px;
}

#title {
	font-size: 25px;
	font-weight: bold;
}
</style>
</head> 
<body> 
	<div id="forgot_password">
		<i class="icon popup_close" data-close=""></i>
		<div class="body custom">
			<p id="title">비밀번호 재설정</p>
			<hr>
			<p class="description">
				가입하신 계정의 이메일을 입력해주세요.<br>
				임의로 설정된 새로운 비밀번호가 메일로 전송 됩니다.
			</p>

			<form novalidate="">
				<input type="text" id="userId" name="userId" placeholder="아이디"
					required=""> <input type="email" id="email" name="email"
					placeholder="이메일" required="">
				<p class="notice">가입시 입력하신 이메일로 임시 비밀번호를 발송합니다.</p>

				<button>비밀번호 재설정하기</button>
			</form>
		</div>
	</div>
</body>
</html>