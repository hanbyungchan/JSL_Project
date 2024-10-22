package dto;

public class LibraryDto {
	String g_code, g_name, u_id,s_img_main;

	public String getS_img_main() {
		return s_img_main;
	}

	public void setS_img_main(String s_img_main) {
		this.s_img_main = s_img_main;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public LibraryDto() {
		super();
	}
}
