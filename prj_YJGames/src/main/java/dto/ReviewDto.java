package dto;

public class ReviewDto {
	String u_id, g_code, u_name, r_txt,r_date,r_recommand,g_name;
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getU_id() {
		return u_id;
	}
	public String getR_recommand() {
		return r_recommand;
	}
	public void setR_recommand(String r_recommand) {
		this.r_recommand = r_recommand;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getR_txt() {
		return r_txt;
	}
	public void setR_txt(String r_txt) {
		this.r_txt = r_txt;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public ReviewDto() {
		super();
	}
	public ReviewDto(String u_id, String g_code,String r_txt, String r_date, String r_recommand) {
		super();
		this.u_id = u_id;
		this.g_code = g_code;
		this.r_txt = r_txt;
		this.r_date = r_date;
		this.r_recommand = r_recommand;
	}

	
}
