package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.MemberDTO;

public class MemberDao {	// 1. db 연동 클래스 
	
	private PreparedStatement ps; 	// 2. sql 조작 인터페이스 
	private Connection con;			// 3. db 연결 인터페이스 
	private ResultSet rs;			// 4. sql 결과 인터페이스 
	
	// db 클래스 생성자 
	public MemberDao(){	
		try {
			con = getConnection();				// 아래에 있는 연결 메소드의 반환타입을 con 에 저장 
					// 반환값과 예외처리 옴 
//			System.out.println("연동성공 ");  // 연동 테스트 출력
		}
		catch (Exception e) {
			System.out.println( e );
		}
	}
	
	// db 연결 메소드 
	public static Connection getConnection() throws Exception {
											// 예외처리 던지기 
		Class.forName("oracle.jdbc.OracleDriver"); // db드라이브 연결 [ 무조건 예외처리 발생 ] 
		// 특정 db 연결 
		Connection con = DriverManager.getConnection 
				("jdbc:oracle:thin:@//localhost:1521/xe" , "system","1234");
		return con; // 연결된 인터페이스 반환
	}
	
	// 1. 마지막회원번호 +1 반환 메소드 
	public int getcustno() {
		
		String sql ="select max(CUSTNO) from member_tbl_02";
		
		try {
			
			ps = con.prepareStatement(sql); // sql 조작 
			rs = ps.executeQuery();			// 결과 연결 
			if( rs.next() ) {				// 결과 가져오기 
				return rs.getInt(1)+1;   // 마지막 회원번호 +1 반환
			}
			
		}catch (Exception e) {}
		return -1; // 만약에 db오류이면 -1 반환 
	}
	
	// 2. 회원등록 
	public boolean join( MemberDTO memberDTO) {
		
		String sql = "insert into Member_tbl_02 values(?,?,?,?,?,?,?)";
		try {
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, memberDTO.getCustno());
			ps.setString(2, memberDTO.getCustname());
			ps.setString(3, memberDTO.getPhone());
			ps.setString(4, memberDTO.getAddress());
			ps.setString(5, memberDTO.getJoindate());
			ps.setString(6, memberDTO.getGrade());
			ps.setString(7, memberDTO.getCity());
			
			ps.executeUpdate(); // sql 실행
			
			return true;
		}catch (Exception e) {} return false;
		
	}
	
	// 3. 모든 회원 가져오기 
	public ArrayList<MemberDTO> getmemberlist(){
		ArrayList<MemberDTO> list = new ArrayList(); // 리스트 선언 
		String sql ="select * from member_tbl_02";
		try {
			ps = con.prepareStatement(sql); 
			rs = ps.executeQuery();
			while( rs.next() ) {
				// 검색결과 레코드 하나씩 dto 생성
				MemberDTO memberDTO = new MemberDTO(
						rs.getString(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getString(4),
						rs.getString(5), 
						rs.getString(6), 
						rs.getString(7));
				list.add(memberDTO); // dto를 리스트에 저장 
			}
			return list; // while 종료시 리스트 반환
		}catch (Exception e) {} return null; // 오류시 null 반환
	}
	
	// 4.특정 회원 호출 [ 조건 : 회원번호 ] 
	public MemberDTO getmember(String custno) {

		String sql ="select * from member_tbl_02 where custno = "+ custno;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if( rs.next() ) { // 결과 레코드 1개 가져와서 dto 생성
				MemberDTO memberDTO = new MemberDTO(
						rs.getString(1), 
						rs.getString(2),
						rs.getString(3), 
						rs.getString(4),
						rs.getString(5), 
						rs.getString(6), 
						rs.getString(7));
				return memberDTO;
			}
		}catch (Exception e) {} return null;
	}
	
	// 5.회원 수정 [ 조건 : 회원번호 ] 
	public boolean update( MemberDTO memberDTO) {
		
		String sql ="update member_tbl_02 set custname=?,phone=?,"
				+ "address=?,joindate=?,grade=?,city=? "
				+ "where custno = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(7, memberDTO.getCustno());
			ps.setString(1, memberDTO.getCustname());
			ps.setString(2, memberDTO.getPhone());
			ps.setString(3, memberDTO.getAddress());
			ps.setString(4, memberDTO.getJoindate());
			ps.setString(5, memberDTO.getGrade());
			ps.setString(6, memberDTO.getCity());
			
			ps.executeUpdate(); // sql 실행
			
			return true;
		}catch (Exception e) {} return false;
	}
	
	// 6. 매출 조회 [ 조건 x , 조인 , 그룹 ] 
	public ArrayList<MemberDTO> getmoneylist(){
		
		ArrayList<MemberDTO> list = new ArrayList(); // 리스트 선언 
		
		String sql ="select A.custno , A.custname , A.grade , SUM(B.PRICE)  from member_tbl_02 A join money_tbl_02 B on A.custno = B.custno GROUP BY (A.CUSTNO , A.CUSTNAME , A.GRADE) ORDER BY SUM(B.PRICE) DESC";
	
		try {
			ps = con.prepareStatement(sql); 
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				MemberDTO memberDTO = new MemberDTO(); // 빈생성자 => 빈객체 
				
				memberDTO.setCustno( rs.getString(1) );
				memberDTO.setCustname(rs.getString(2));
				memberDTO.setGrade(rs.getString(3));
				// dto에 money 필드 추가 
				memberDTO.setMoney( rs.getString(4));
					
				list.add(memberDTO); // dto를 리스트에 저장 
			}
			return list; // while 종료시 리스트 반환
		}catch (Exception e) {} return null; // 오류시 null 반환
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}




