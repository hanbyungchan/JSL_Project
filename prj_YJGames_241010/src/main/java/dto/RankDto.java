package dto;

public class RankDto {
	
	private String g_code, g_name, g_img;
	private int g_downloaded;
	
	public RankDto() {}
	public RankDto(String g_code, String g_name, String g_img, int g_downloaded) {
		super();
		this.g_code = g_code;
		this.g_name = g_name;
		this.g_img = g_img;
		this.g_downloaded = g_downloaded;
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
	public String getG_img() {
		return g_img;
	}
	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	public int getG_downloaded() {
		return g_downloaded;
	}
	public void setG_downloaded(int g_downloaded) {
		this.g_downloaded = g_downloaded;
	}
	
	
	
	
	
}
