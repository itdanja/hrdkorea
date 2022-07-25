package DTO;

public class ExamDto {
	
	private String 학년;
	private String 반;
	private String 번호;
	private String 이름;
	private int 국어;
	private int 수학;
	private int 영어;
	private int 역사;
	private int 합계;
	private double 평균;
	private int 순위;
	
	public ExamDto() {
		// TODO Auto-generated constructor stub
	}

	public ExamDto(String 학년, String 반, String 번호, String 이름, int 국어, int 수학, int 영어, int 역사, int 합계, double 평균,
			int 순위) {
		super();
		this.학년 = 학년;
		this.반 = 반;
		this.번호 = 번호;
		this.이름 = 이름;
		this.국어 = 국어;
		this.수학 = 수학;
		this.영어 = 영어;
		this.역사 = 역사;
		this.합계 = 합계;
		this.평균 = 평균;
		this.순위 = 순위;
	}

	public String get학년() {
		return 학년;
	}

	public void set학년(String 학년) {
		this.학년 = 학년;
	}

	public String get반() {
		return 반;
	}

	public void set반(String 반) {
		this.반 = 반;
	}

	public String get번호() {
		return 번호;
	}

	public void set번호(String 번호) {
		this.번호 = 번호;
	}

	public String get이름() {
		return 이름;
	}

	public void set이름(String 이름) {
		this.이름 = 이름;
	}

	public int get국어() {
		return 국어;
	}

	public void set국어(int 국어) {
		this.국어 = 국어;
	}

	public int get수학() {
		return 수학;
	}

	public void set수학(int 수학) {
		this.수학 = 수학;
	}

	public int get영어() {
		return 영어;
	}

	public void set영어(int 영어) {
		this.영어 = 영어;
	}

	public int get역사() {
		return 역사;
	}

	public void set역사(int 역사) {
		this.역사 = 역사;
	}

	public int get합계() {
		return 합계;
	}

	public void set합계(int 합계) {
		this.합계 = 합계;
	}

	public double get평균() {
		return 평균;
	}

	public void set평균(double 평균) {
		this.평균 = 평균;
	}

	public int get순위() {
		return 순위;
	}

	public void set순위(int 순위) {
		this.순위 = 순위;
	}
	
	

}
