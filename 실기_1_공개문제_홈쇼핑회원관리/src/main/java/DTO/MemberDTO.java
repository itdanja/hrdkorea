package DTO;

public class MemberDTO {
	
	private String custno;
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private String city;
	private String money;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String custno, String custname, String phone, String address, String joindate, String grade,
			String city) {
		this.custno = custno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.grade = grade;
		this.city = city;
	}
	
	

	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getCustno() {
		return custno;
	}

	public void setCustno(String custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	
	
	

}
