package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ResDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_3_0115";
			String password = "smhrd3";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// OracleDriver 클래스가 해당 위치에 없는경우(ojdbc6.jar 미포함)
			// 해결방안: WEB-INF->lib->ojdbc6.jar 저장

			// 2. OracleDriver 경로가 오타인경우
			e.printStackTrace();
		} catch (SQLException e) {
			// DB연결 정보가 정확하지 않을 경우

			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ResDTO> resAddress(){
		ArrayList<ResDTO> list = new ArrayList<ResDTO>();
		connect();
		
		sql = "select res_name, res_tel, res_time, res_ct, res_add, res_img, res_info, res_lat, res_lng from res";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String res_name = rs.getString(1);
				String res_tel = rs.getString(2);
				String res_time = rs.getString(3);
				String res_ct = rs.getString(4);
				String res_add = rs.getString(5);
				String res_img = rs.getString(6);
				String res_info = rs.getString(7);
				String res_lat = rs.getString(8);
				String res_lng = rs.getString(9);
				
				ResDTO res = new ResDTO(res_name, res_tel, res_time, res_ct, res_add, 0, res_img, res_info, 0, res_lat, res_lng);
				list.add(res);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
