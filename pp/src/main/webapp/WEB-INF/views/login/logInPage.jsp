<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/logincss.css" rel="stylesheet" />
<!-- 네이버 스크립트 -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- Google 스크립트 -->
<meta name="google-signin-client_id" content="819749508084-500igqbm0gk3blq72729tc4kkit81e2v.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Social Sign-In Page</title>
</head>
<body>
	<div class="container">
		<div class="child">
			<!-- Naver signin button -->
			<div class="loginButton" id="naverIdLogin"></div>
			<!-- Kakao signin button -->
			<div class="loginButton">
				<img alt="카카오 로그인"
					src="resources/login/kakao/kakao_login_medium_narrow.png"
					onclick="kakaoLogin();">
			</div>
		</div>
	</div>

	<script type="text/javascript">
	/* 네이버 로그인 */
	var naverLogin = new naver.LoginWithNaverId(
	        {
	            clientId: "w5TvHh6F6HXrvs51J2ym",
	            callbackUrl: "http://localhost:8080/pp/naverlogincallback.do",
	            isPopup: false,
	            loginButton: {color: "green", type: 3, height: 40}
	        }
	    );
	naverLogin.init();
	
	/* 카카오 로그인 */
 	window.Kakao.init('6626f9810426bcea43445e50989b6eec');
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, profile_image', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account);
                            var nickname = kakao_account.profile.nickname;
                            var profileImgUrl = kakao_account.profile.profile_image_url;
                            var profileImgThumnailUrl = kakao_account.profile.thumbnail_image_url;
                            location.href = "kakaologincallback.do?nickname=" + nickname + "&profileimgurl=" + 
                            		profileImgUrl + "&profileImgThumnailUrl=" + profileImgThumnailUrl;
                        }
                    });
                    // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
	</script>
</body>
</html>
