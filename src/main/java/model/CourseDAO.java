package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CourseDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
//	private String sql;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_3_0115";
			String password = "smhrd3";
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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

//	public CourseDTO selectThemeInfo(String theme_name) {
//		connect();
//		TsDTO ts = null;
//		try {
//			String plusViewsSql = "select ";
//			psmt = conn.prepareStatement(plusViewsSql);
//			psmt.setString(1, theme_name);
//			rs = psmt.executeQuery();
//			if (rs.next()) {
//				String getTsInfoSql = "select ts_tel, ts_time, ts_ct, ts_add, ts_loc, ts_img, ts_info, ts_views, ts_lat, ts_lng from ts where ts_name=?";
//				psmt = conn.prepareStatement(getTsInfoSql);
//				psmt.setString(1, ts_name);
//				rs = psmt.executeQuery();
//				if (rs.next()) {
//					ts = new TsDTO(ts_name, rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10));
//				}
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//
//		return ts;
//	}
	
	public CourseDTO selectCourse(int theme_num) {
		connect();
		
		CourseDTO course = null;
		try {
			String selectCourse = "select theme_name, theme_ct, theme_course, theme_dis, theme_img from theme where theme_num=?";
			psmt = conn.prepareStatement(selectCourse);
			//String t = "무등산 전망대";
			System.out.println(theme_num);
//			System.out.println(ts_name);
			psmt.setInt(1, theme_num);

			rs = psmt.executeQuery();
			if (rs.next()) {
				String name = rs.getString(1);
				String ct = rs.getString(2);
				String cs = rs.getString(3);
				String dis = rs.getString(4);
				String img = rs.getString(5);
				course = new CourseDTO(theme_num, name, ct, cs, dis, img);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return course;
	}
	
	public ArrayList<CourseDTO> courseSelectAll() {
		
		ArrayList<CourseDTO> list = new ArrayList<CourseDTO>();
		connect();
		String sql = "select theme_name, theme_ct, theme_course, theme_dis, theme_img from theme";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				// rs객체 내 저장된 회원정보들은 접근 -> Member 객체 생성 -> list에 저장
				String name = rs.getString(1);
				String ct = rs.getString(2);
				String cs = rs.getString(3);
				String dis = rs.getString(4);
				String img = rs.getString(5);
				
				list.add(new CourseDTO(0, name, ct, cs, dis, img));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

}
