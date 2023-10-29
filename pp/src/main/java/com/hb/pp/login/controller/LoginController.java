package com.hb.pp.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hb.pp.login.model.vo.Login;

@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());


	@RequestMapping(value = "sociallogin.do", method = RequestMethod.GET)
	public String moveSignInPage() {
		return "login/logInPage";
	}

	// --------------네이버 로그인 관련 메소드들-------------

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naverlogincallback.do", method = RequestMethod.GET)
	public String naverCallback() {
		return "login/naver/naverCallback";
	}
	
	// 네이버 로그인 성공시 회원 DB 저장용 메소드
	@RequestMapping(value = "naverlogininsert.do", method = RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age,
			@RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email,
			@RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id,
			@RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName) {
		System.out.println("#############################################");
		System.out.println(n_age);
		System.out.println(n_birthday);
		System.out.println(n_email);
		System.out.println(n_gender);
		System.out.println(n_id);
		System.out.println(n_name);
		System.out.println(n_nickName);
		System.out.println("#############################################");

		Login login = new Login();
		login.setAge(n_age);
		login.setBirthday(n_birthday);
		login.setEmail(n_email);
		login.setGender(n_gender);
		login.setId(n_id);
		login.setName(n_name);
		login.setNickname(n_nickName);

		String result = "no";

		if (login != null) {
			result = "ok";
		}

		return result;
	}
	
	
	// 카카오 로그인 관련 메소드들
	@RequestMapping(value = "kakaologincallback.do", method = RequestMethod.GET)
	public String kakaoCallback(@RequestParam("nickname") String nickname,
								@RequestParam("profileimgurl") String profileimgurl,
								@RequestParam("profileImgThumnailUrl") String profileImgThumnailUrl, 
								Model model) {
		System.out.println(nickname);
		System.out.println(profileimgurl);
		System.out.println(profileImgThumnailUrl);
		model.addAttribute("nickname", nickname);
		model.addAttribute("profileimgurl", profileimgurl);
		model.addAttribute("profileImgThumnailUrl", profileImgThumnailUrl);
		return "login/kakao/kakaoCallback";
	}
}
