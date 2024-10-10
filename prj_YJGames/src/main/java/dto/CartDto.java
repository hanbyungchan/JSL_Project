package dto;

public class CartDto {
	String u_id, g_code, g_name, s_sale;
	double g_price, g_price2;
	public String getU_id() {
		return u_id;
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
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getS_sale() {
		return s_sale;
	}
	public void setS_sale(String s_sale) {
		this.s_sale = s_sale;
	}
	public double getG_price() {
		return g_price;
	}
	public void setG_price(double g_price) {
		this.g_price = g_price;
	}
	public double getG_price2() {
		return g_price2;
	}
	public void setG_price2(double g_price2) {
		this.g_price2 = g_price2;
	}
	public CartDto() {
		super();
	}
	
}
