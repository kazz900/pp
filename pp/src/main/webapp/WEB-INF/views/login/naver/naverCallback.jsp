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
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<title>Naver Callback Page</title>
</head>
<body>
	<div class="container">
		<div class="container">
			<div class="child">
				<!-- Naver Login User Info --> 
				<div class="naverLoginInfoArea" id="naverLoginInfo">
				<h3>Naver Login Successful</h3>
					<p id="n_name"></p>
					<p id="n_nickName"></p>
					<p id="n_gender"></p>
					<p id="n_email"></p>
					<p id="n_age"></p>
					<p id="n_birthday"></p>
				</div>
				<!-- Naver Sign-Out Button -->
				<br>
				<img alt="Naver Sign out" onclick="naverLogout();" src="resources/login/naver/btnG_logout.png" class="loginButton">
			</div>
		</div>
	</div>

	<script>
		var testPopUp;
		function openPopUp() {
			testPopUp = window
					.open("https://nid.naver.com/nidlogin.logout", "_blank",
							"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
		}
		function closePopUp() {
			testPopUp.close();
		}

		function naverLogout() {
			openPopUp();
			setTimeout(function() {
				closePopUp();
				location.replace("http://localhost:8080/pp/");
			}, 1);
		}
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "w5TvHh6F6HXrvs51J2ym", // 본인걸로 수정, 띄어쓰기 금지.
			callbackUrl : "http://localhost:8080/pp/", // 아무거나 설정
			isPopup : false,
			callbackHandle : true
		});
		naverLogin.init();

		window
				.addEventListener(
						'load',
						function() {
							naverLogin
									.getLoginStatus(function(status) {

										if (status) {
											/* console.log(naverLogin.user); */
											var age = naverLogin.user.getAge();
											var birthday = naverLogin.user
													.getBirthday();
											var email = naverLogin.user
													.getEmail();
											var gender = naverLogin.user
													.getGender();
											var id = naverLogin.user.getId();
											var name = naverLogin.user
													.getName();
											var nickName = naverLogin.user
													.getNickName();

											$.ajax({
														type : 'post',
														url : 'naverlogininsert.do',
														data : {
															'n_age' : age,
															'n_birthday' : birthday,
															'n_email' : email,
															'n_gender' : gender,
															'n_id' : id,
															'n_name' : name,
															'n_nickName' : nickName
														},
														dataType : 'text',
														success : function(
																result) {
															if (result == 'ok') {
																console.log('성공');
																/* ajax 통신으로 유저의 정보를 컨트롤러에 전달한 후 naverLoginInfoArea에 추가 */
																const n_age_p = document.getElementById("n_age");
																const n_birthday_p = document.getElementById("n_birthday");
																const n_email_p = document.getElementById("n_email");
																const n_gender_p = document.getElementById("n_gender");
																const n_name_p = document.getElementById("n_name");
																const n_nickName_p = document.getElementById("n_nickName");
																
																n_age_p.innerHTML = 'age range: ' + age;
																n_birthday_p.innerHTML = 'birthday: ' + birthday;
																n_email_p.innerHTML = 'email: ' + email;
																n_gender_p.innerHTML = 'gender: ' + gender;
																n_name_p.innerHTML =  'name: ' + name;
																n_nickName_p.innerHTML = 'nickname: ' + nickName;
															} else if (result == 'no') {
																console
																		.log('실패');
																location
																		.replace("http://localhost:8070/spring/home1.do");
															}
														},
														error : function(result) {
															console
																	.log('오류 발생');
														}
													});

										} else {
											console
													.log("callback 처리에 실패하였습니다.");
										}
									});
						});
	</script>
</body>
</html>