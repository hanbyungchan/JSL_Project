package dto;

import java.util.List;

public class GameRegiDto {
    String g_code;
    String g_name;
    String g_file;
    String g_developer;
    String g_grade;
    List<String> genre_code;  // 변경: List<String>로 선언
    String genre_name;
    String g_confirm;
    double g_price;

    public GameRegiDto() {}

    public GameRegiDto(String g_code, String g_name, String g_file, String g_developer, String g_grade,
                       List<String> genre_code, String g_confirm, double g_price) {  // 변경: List<String> 인자
        this.g_code = g_code;
        this.g_name = g_name;
        this.g_file = g_file;
        this.g_developer = g_developer;
        this.g_grade = g_grade;
        this.genre_code = genre_code;  // 변경: List<String> 할당
        this.g_confirm = g_confirm;
        this.g_price = g_price;
    }

    // Getter 및 Setter 메소드
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

    public String getG_file() {
        return g_file;
    }

    public void setG_file(String g_file) {
        this.g_file = g_file;
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

    public List<String> getGenre_code() {  // 변경: List<String> 반환
        return genre_code;
    }

    public void setGenre_code(List<String> genre_code) {  // 변경: List<String> 할당
        this.genre_code = genre_code;
    }

    public String getGenre_name() {
        return genre_name;
    }

    public void setGenre_name(String genre_name) {
        this.genre_name = genre_name;
    }

    public String getG_confirm() {
		return g_confirm;
	}

	public void setG_confirm(String g_confirm) {
		this.g_confirm = g_confirm;
	}

	public double getG_price() {
        return g_price;
    }

    public void setG_price(double g_price) {
        this.g_price = g_price;
    }
}