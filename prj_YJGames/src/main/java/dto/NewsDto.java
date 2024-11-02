package dto;

public class NewsDto {
	private String n_no, n_title, n_content, n_attach, n_uploader, n_upload_date, n_update_date, g_code;
	
	public NewsDto() {}
	
	public NewsDto(String n_no, String n_title, String n_content, String n_attach, String n_uploader,
			String n_upload_date, String n_update_date, String g_code) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_attach = n_attach;
		this.n_uploader = n_uploader;
		this.n_upload_date = n_upload_date;
		this.n_update_date = n_update_date;
		this.g_code = g_code;
	}
	//등록
	public NewsDto(String n_no, String n_title, String n_content, String n_attach, String n_uploader,
			String n_upload_date, String g_code) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_attach = n_attach;
		this.n_uploader = n_uploader;
		this.n_upload_date = n_upload_date;
		this.g_code = g_code;
	}
	//수정
	public NewsDto(String n_no, String n_title, String n_content, String n_attach, String n_update_date) {
		super();
		this.n_no = n_no;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_attach = n_attach;
		this.n_update_date = n_update_date;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public String getN_no() {
		return n_no;
	}

	public void setN_no(String n_no) {
		this.n_no = n_no;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_attach() {
		return n_attach;
	}

	public void setN_attach(String n_attach) {
		this.n_attach = n_attach;
	}

	public String getN_uploader() {
		return n_uploader;
	}

	public void setN_uploader(String n_uploader) {
		this.n_uploader = n_uploader;
	}

	public String getN_upload_date() {
		return n_upload_date;
	}

	public void setN_upload_date(String n_upload_date) {
		this.n_upload_date = n_upload_date;
	}

	public String getN_update_date() {
		return n_update_date;
	}

	public void setN_update_date(String n_update_date) {
		this.n_update_date = n_update_date;
	}
	
	
}
