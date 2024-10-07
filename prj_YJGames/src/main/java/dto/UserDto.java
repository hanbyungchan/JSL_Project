package dto;

public class UserDto {
	String u_id, u_name, u_password, u_birth, u_gender, u_email_1, u_email_2, u_level;

	public UserDto() {}
	
	
	//등록
	public UserDto(String u_id, String u_name, String u_password, String u_birth, String u_gender, String u_email_1,
			String u_email_2, String u_level) {
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_password = u_password;
		this.u_birth = u_birth;
		this.u_gender = u_gender;
		this.u_email_1 = u_email_1;
		this.u_email_2 = u_email_2;
		this.u_level = u_level;
	}



	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_email_1() {
		return u_email_1;
	}

	public void setU_email_1(String u_email_1) {
		this.u_email_1 = u_email_1;
	}

	public String getU_email_2() {
		return u_email_2;
	}

	public void setU_email_2(String u_email_2) {
		this.u_email_2 = u_email_2;
	}

	public String getU_level() {
		return u_level;
	}

	public void setU_level(String u_level) {
		this.u_level = u_level;
	}
	
	
	
	
}
