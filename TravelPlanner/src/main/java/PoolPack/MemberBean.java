package PoolPack;

public class MemberBean {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	
	
	public String getId() {
		return id;	
	}

	public void setId(String _id) {
		this.id = _id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String _pw) {
		this.pw = _pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String _phone) {
		this.phone = _phone;
	}
}