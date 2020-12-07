package model;

public class User_MemberDTO {
private String id;
private String pw;
private String email;
private String name;
private String tel;

public User_MemberDTO(String id, String pw, String email, String name, String tel) {
	this.id = id;
	this.pw = pw;
	this.email = email;
	this.name = name;
	this.tel = tel;
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

public String getTel() {
	return tel;
}

public void setTel(String tel) {
	this.tel = tel;
}

@Override
public String toString() {
	return "User_MemberDTO [id=" + id + ", pw=" + pw + ", email=" + email + ", name=" + name + ", tel=" + tel + "]";
}


}
