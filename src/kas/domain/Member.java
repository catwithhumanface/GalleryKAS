package kas.domain;

public class Member {
	private String email;
	private String name;
	private String pwd;
	private String listList;
	
	public Member() {}

	public Member(String email, String name, String pwd, String listList) {
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.listList = listList;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getListList() {
		return listList;
	}

	public void setListList(String listList) {
		this.listList = listList;
	}
	
	
}
