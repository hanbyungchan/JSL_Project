package dto;

public class GenreDto {
	
	private String genre_code, genre_name;
	
	public GenreDto() {}
	public GenreDto(String genre_code, String genre_name) {
		super();
		this.genre_code = genre_code;
		this.genre_name = genre_name;
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
	
	
	
	
	
	
}
