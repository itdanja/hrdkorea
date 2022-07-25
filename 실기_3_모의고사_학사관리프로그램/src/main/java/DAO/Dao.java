package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import DTO.Dto;

public class Dao {

	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	// 생성자
	public Dao() { 
		try {
			this.con = getConnection();
			System.out.println("연동 성공");
		}catch (Exception e) {
			System.out.println("연동 실패 : "+ e);
		}
	}
	// 시험지에 적혀있는 코드
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		return con;
	}
	
	// 1. 학생 목록 출력 메소드 
	public ArrayList<Dto> getlist(){
		ArrayList<Dto> list = new ArrayList<>();
		
		try {
			String sql = "select * from student_tbl_03";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				Dto dto = new Dto( rs.getString(1) , 
						rs.getString(2),
						rs.getString(3), 
						rs.getString(4), 
						rs.getString(5) );
				list.add(dto);
			}
		}catch (Exception e) { System.out.println(e);}
		
		return list; 
	}
	// 2. 학생 성적 입력
	public boolean examinput( String sno , String ekor , String emath ,  String eeng ,  String ehist ) {
		String sql = "insert into exam_tbl_03 values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString( 1 , sno ); 	ps.setString( 2 , ekor );
			ps.setString( 3 , emath ); 	ps.setString( 4 , eeng );
			ps.setString( 5 , ehist );	ps.executeUpdate();
			return true;
		}catch (Exception e) { System.out.println(e);}
		return false;
	}
	
	// 3. 학생 성적 출력 
	public ArrayList<  Map< String , String > > getexamlist() {
		ArrayList<  Map< String , String > > list = new ArrayList<>();
		String sql = "	SELECT "
				+ "		SUBSTR( A.SNO , 1 , 1 ) 학년 , "
				+ "		SUBSTR( A.SNO , 2 , 2 ) 반 , "
				+ "		SUBSTR( A.SNO , 4 , 2 ) 번호  , "
				+ "		A.SNAME 이름 , "
				+ "		B.EKOR 국어 , "
				+ "		B.EMATH 수학 , "
				+ "		B.EENG 영어 , "
				+ "		B.EHIST 역사 , "
				+ "		( B.EKOR+B.EMATH+B.EENG+B.EHIST ) 합계 ,"
				+ "		( B.EKOR+B.EMATH+B.EENG+B.EHIST )/4 평균 ,"
				+ "		RANK() OVER( ORDER BY ( NVL(B.EKOR,0) + NVL(B.EMATH,0)+ NVL(B.EENG,0) +NVL(B.EHIST,0) ) DESC ) 순위 "
				+ "	FROM "
				+ "		student_tbl_03 A "
				+ "			FULL OUTER JOIN "
				+ "		exam_tbl_03 B "
				+ "			ON A.sno = B.sno "
				+ "	ORDER BY ( NVL(B.EKOR,0) + NVL(B.EMATH,0)+ NVL(B.EENG,0) + NVL(B.EHIST,0)  ) DESC";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				Map< String , String > map = new HashMap<String, String>();
				map.put( "학년", rs.getString(1));
				map.put( "반", rs.getString(2));
				map.put( "번호", rs.getString(3));
				map.put( "이름", rs.getString(4));
				map.put( "국어", rs.getInt(5)+"");
				map.put( "수학", rs.getInt(6)+"");
				map.put( "영어", rs.getInt(7)+"");
				map.put( "역사", rs.getInt(8)+"");
				map.put( "합계", rs.getInt(9)+"");
				map.put( "평균", rs.getInt(10)+"");
				map.put( "순위", rs.getInt(11)+"");
				list.add( map );
			}
		}catch (Exception e) { System.out.println( e );}
		return list;
	}
	
	
	
}


















