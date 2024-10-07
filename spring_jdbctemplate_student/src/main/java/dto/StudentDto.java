package dto;

public class StudentDto {
	
	
	String syear, sclass, no, name;
	int kor, eng, math;
	
	public StudentDto() {}
	
	public StudentDto(String syear, String sclass, String no, String name, int kor, int eng, int math) {
		this.syear = syear;
		this.sclass = sclass;
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
	public StudentDto(String syear, String sclass, String no, String name) {
		this.syear = syear;
		this.sclass = sclass;
		this.no = no;
		this.name = name;
	}




	public String getSyear() {
		return syear;
	}

	public void setSyear(String syear) {
		this.syear = syear;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}
	
	
	
}
