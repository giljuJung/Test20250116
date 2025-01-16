package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDto;

public class MemberDao {
	public Connection getConnection() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "asana";
		String pw = "1234";
		
		Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, id, pw);
		return conn;
	}
	// 회원가입 하기
	public void registerMember(String id, String pw, String name) throws Exception {
		String sql = "INSERT INTO member(id, pw, name) VALUES (?,?,?)";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,  id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	// 로그인 여부확인
	public boolean CheckMember(String id, String pw) throws Exception {
		String sql ="SELECT * FROM member WHERE id = ? AND pw = ?";
		Connection conn = getConnection();
		
		boolean login = false;
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		login = rs.next();
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return login;
	}
	// 멤버 조회
	public MemberDto getMemberDto(String id) throws Exception {
		String sql ="SELECT id, pw, name, point FROM member WHERE id = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		MemberDto dto = null;
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String userId = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			int point = rs.getInt("point");
			
			dto = new MemberDto(userId, pw, name, point);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return dto;
	}
	// 포인트 차감
	public void minusPoint(int price, String id) throws Exception {
		String sql = "UPDATE member SET point = point - ? WHERE id = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  price);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	// 포인트 추가
	public void plusPoint(int point, String id) throws Exception {
		String sql = "UPDATE member SET point = point + ? WHERE id = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  point);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	//멤버 조회
	public ArrayList<MemberDto> memberDtoList() throws Exception {
		String sql = "SELECT id, pw, name, point FROM member";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			int point = rs.getInt("point");
			MemberDto dto = new MemberDto(id, pw, name, point);
			list.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	// 계정 삭제
	public void deleteMember(String id) throws Exception {
		String sql = "DELETE FROM member WHERE id = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	// 계정 업데이트
	public void updateMember(String pw, String name, int point, String id) throws Exception {
		String sql = "UPDATE member SET pw = ?, name = ?, point = ? WHERE id = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, name);
		pstmt.setInt(3, point);
		pstmt.setString(4, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	// 1포인트씩 증가(스케줄러)
	public int SchedulerPlusPoint() throws Exception {
		String sql = "UPDATE member SET point = point + 1 ";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int updateRows = 0;
		updateRows = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		return updateRows;
	}
	
	public static void main(String[] args) throws Exception{
		MemberDao dao = new MemberDao();
		dao.registerMember("YG", "1234", "YGt"); // 회원가입
		System.out.println(dao.CheckMember("YG", "1234")); // 로그인 여부확인
		System.out.println(dao.getMemberDto("YG").getName()); // 멤버 조회
		dao.minusPoint(100, "YG"); // 포인트 차감
		dao.plusPoint(1000000, "YG"); // 포인트 추가
		int updateRows = dao.SchedulerPlusPoint();
		System.out.println(updateRows); // 스케줄러 인원 확인 & 1포인트 증가
		ArrayList<MemberDto> list = dao.memberDtoList();
		for(MemberDto dto : list) { // 모든 멤버 조회
			System.out.println(dto.getId());
		}
		dao.deleteMember("1234"); // 계정 삭제
		dao.updateMember("1234", "GJ", 1000, "a1234"); // 계정 수정
	}
}
