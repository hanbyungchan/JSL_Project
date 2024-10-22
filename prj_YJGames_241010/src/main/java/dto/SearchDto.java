package dto;

public class SearchDto {
	private String g_code, g_name, g_developer, g_grade, genre_code, genre_name, s_page_no, g_file,s_img_main;
	private double g_price, s_sale, g_sale_price;
	
	public SearchDto() {}
	public SearchDto(String g_code, String g_name, String g_developer, String g_grade, String genre_code,
			String genre_name, String s_page_no, String g_file, double g_price, double s_sale, double g_sale_price) {
		super();
		this.g_code = g_code;
		this.g_name = g_name;
		this.g_developer = g_developer;
		this.g_grade = g_grade;
		this.genre_code = genre_code;
		this.genre_name = genre_name;
		this.s_page_no = s_page_no;
		this.g_file = g_file;
		this.g_price = g_price;
		this.s_sale = s_sale;
		this.g_sale_price = g_sale_price;
	}
	
	
	
	public double getG_sale_price() {
		return g_sale_price;
	}
	public void setG_sale_price(double g_sale_price) {
		this.g_sale_price = g_sale_price;
	}
	public String getG_file() {
		return g_file;
	}
	public void setG_file(String g_file) {
		this.g_file = g_file;
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
	public String getG_developer() {
		return g_developer;
	}
	public void setG_developer(String g_developer) {
		this.g_developer = g_developer;
	}
	public String getG_grade() {
		return g_grade;
	}
	public void setG_grade(String g_grade) {
		this.g_grade = g_grade;
	}
	public String getGenre_code() {
		return genre_code;
	}
	public void setGenre_code(String genre_code) {
		this.genre_code = genre_code;
	}
	public String getGenre_name() {
		return genre_name;
	}
	public void setGenre_name(String genre_name) {
		this.genre_name = genre_name;
	}
	public String getS_page_no() {
		return s_page_no;
	}
	public void setS_page_no(String s_page_no) {
		this.s_page_no = s_page_no;
	}
	public double getG_price() {
		return g_price;
	}
	public void setG_price(double g_price) {
		this.g_price = g_price;
	}
	public double getS_sale() {
		return s_sale;
	}
	public void setS_sale(double s_sale) {
		this.s_sale = s_sale;
	}
	public String getS_img_main() {
		return s_img_main;
	}
	public void setS_img_main(String s_img_main) {
		this.s_img_main = s_img_main;
	}
	
	
}
