package com.hb.pp.login.model.vo;

public class Login {
	private String age;
	private String birthday;
	private String email;
	private String gender;
	private String id;
	private String name;
	private String nickname;
	
	public Login() {
		super();
	}
	public Login(String age, String birthday, String email, String gender, String id, String name, String nickname) {
		super();
		this.age = age;
		this.birthday = birthday;
		this.email = email;
		this.gender = gender;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "Login [age=" + age + ", birthday=" + birthday + ", email=" + email + ", gender=" + gender + ", id=" + id
				+ ", name=" + name + ", nickname=" + nickname + "]";
	}
	
	
}
