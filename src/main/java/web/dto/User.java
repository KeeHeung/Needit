package web.dto;

import java.util.Date;

public class User {
	
	private String id;
	private String pw;
	private String name;
	private String nick;
	private String birth;
	private String email;
	private String gender;
	private String phone;
	private String addr1;
	private String addr2;
	private Date joinDate;

	public User() {}

	public User(String id, String pw, String name, String nick, String birth, String email, String gender, String phone,
			String addr1, String addr2, Date joinDate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.birth = birth;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", birth=" + birth + ", email="
				+ email + ", gender=" + gender + ", phone=" + phone + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", joinDate=" + joinDate + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
