package com.naver.point;

public class PointDTO {
	
	//멤버변수의 접근지정자 private
	//getter, setter
	//생성자는 디폴트생성자는 필요.
	//멤버변수의 이름은 테이블의 컬럼명과 동일
	//테이블의 컬럼명 = 파라미터이름 = DTO의 멤버변수이름
	
	private int num; //int말고 Integer로 선언해도 된다.
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double avg;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	
}
