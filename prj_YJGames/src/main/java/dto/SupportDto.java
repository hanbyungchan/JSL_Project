package dto;

public class SupportDto {
	private String s_code,s_txt,s_type,s_title,s_date,u_id,u_name;

	public SupportDto() {
		super();
	}

	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}

	public String getS_txt() {
		return s_txt;
	}

	public void setS_txt(String s_txt) {
		this.s_txt = s_txt;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
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

	public SupportDto(String s_code, String s_txt, String s_type, String s_title, String s_date, String u_id) {
		super();
		this.s_code = s_code;
		this.s_txt = s_txt;
		this.s_type = s_type;
		this.s_title = s_title;
		this.s_date = s_date;
		this.u_id = u_id;
	}
	
}
