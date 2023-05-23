package controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Dao {

	// 1. 문항지에 있는 db연동 함수 
	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/test2",
				"root",
				"1234");
		return con;
	}
	
	// 2. sql 조작 인터페이스 
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	// 3. 생성자 [ 객체 생성시 db 연동 함수 호출 ] 
	public Dao() {
		try { con = getConnection(); System.out.println("연동성공");
		}catch (Exception e) { System.out.println("연동실패"+e); }
	}
	
	// 4.
	public List<Dto> getList(){
		
		List<Dto> list = new ArrayList<>();
		String sql ="SELECT "
				+ "	M.m_no, "
				+ "	M.m_name, "
				+ "	P.p_name, "
				+ "	M.p_school ,"
				+ "	M.m_jumin, "
				+ "	M.m_city, "
				+ "	P.p_tel1,"
				+ "	P.p_tel2,"
				+ "	P.p_tel3 "
				+ " FROM "
				+ "	tbl_member_202005 M "
				+ "		natural join "
				+ "	tbl_party_202005 P";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				Dto dto = new Dto( rs.getString(1) ,
						rs.getString(2),
						rs.getString(3),
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8), 
						rs.getString(9));
				list.add(dto);
			}
		}catch (Exception e) { System.out.println(e);}
		return list;
	}
	
	// 4. 
	public boolean vote( Dto dto ) {
		String sql = "INSERT INTO tbl_vote_202005 VALUES(?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getV_jumin() );
			ps.setString(2, dto.getV_name() );
			ps.setString(3, dto.getM_no() );
			ps.setString(4, dto.getV_time() );
			ps.setString(5, dto.getV_area() );
			ps.setString(6, dto.getV_confirm() );
			ps.executeUpdate(); return true;
		}catch (Exception e) {System.out.println(e);}
		return false;
	}
	
	// 4.
	public List<Dto> getConfirmList(){
		List<Dto> list = new ArrayList<>();
		String sql ="select\n"
				+ "	v_name,\n"
				+ "    v_jumin,\n"
				+ "    v_time,\n"
				+ "    m_no,\n"
				+ "    v_confirm\n"
				+ "from \n"
				+ "	tbl_vote_202005\n"
				+ "where\n"
				+ "	v_area = '제1투표장'";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				Dto dto = new Dto( 
						rs.getString(4) ,
						rs.getString(2) ,
						rs.getString(1) ,
						rs.getString(3) ,
						rs.getString(5) );
				list.add(dto);
			}
		}catch (Exception e) { System.out.println(e);}
		return list;
		
	}
	
	// 5.
	public List<Dto> getVoteTop(){
		List<Dto> list = new ArrayList<>();
		String sql ="SELECT M.m_no, M.m_name, count(*) v_total "
				+ "FROM tbl_member_202005 M natural join tbl_vote_202005 V "
				+ "WHERE V.v_confirm = 'Y' "
				+ "GROUP BY M.m_no, M.m_name ORDER BY v_total DESC";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				Dto dto = new Dto( 
						rs.getString(1) ,
						rs.getString(2) ,
						rs.getInt(3) );
				list.add(dto);
			}
		}catch (Exception e) { System.out.println(e);}
		return list;
		
	}

}













