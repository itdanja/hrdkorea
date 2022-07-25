package DTO;

public class Dto {
	
	private String sno;
	private String sname;
	private String sphone;
	private String sgender;
	private String saddress;
	
	public Dto() { }

	public Dto(String sno, String sname, String sphone, String sgender, String saddress) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.sphone = sphone;
		this.sgender = sgender;
		this.saddress = saddress;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	
	

}
