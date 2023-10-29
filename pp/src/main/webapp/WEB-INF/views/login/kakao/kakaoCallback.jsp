<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/logincss.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Kakao Callback Page</title>
</head>
<body>
	<div class="container">
		<div class="container">
			<div class="child">
				<!-- Kakao Login User Info -->
				<div class="naverLoginInfoArea" id="naverLoginInfo">
					<h3>Kaoao Login Successful</h3>
					<p id="n_name">${ requestScope.nickname }</p>
					<img alt="" src="${ requestScope.profileImgThumnailUrl }"
						height="50px"><br> <img alt=""
						src="${ requestScope.profileimgurl }" height="200px">
				</div>
				<!-- Naver Sign-Out Button -->
				<br><button onclick="kakaoLogout();">카카오 로그아웃</button>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		/* 카카오 로그인 */
	 	window.Kakao.init('6626f9810426bcea43445e50989b6eec');
		function kakaoLogout() {
	    	if (!Kakao.Auth.getAccessToken()) {
			    console.log('Not logged in.');
			    location.href = "sociallogin.do";
			    return;
		    }
		    Kakao.Auth.logout(function(response) {
	    		location.href = "sociallogin.do";
		    });
		};
	</script>
</body>
</html>