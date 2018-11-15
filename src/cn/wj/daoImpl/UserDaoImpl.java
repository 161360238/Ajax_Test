package cn.wj.daoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.wj.bean.User;
import cn.wj.dao.UserDao;

public class UserDaoImpl implements UserDao{

	public User selectUserDao(String uname) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		User u=null;
		try {
			// 1����������
			Class.forName("com.mysql.jdbc.Driver");
			// 2����������
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/408", "root", "161360238");
			// 3������sql����
			String sql = "select * from t_user where uname=?";
			// 4������sql�������
			ps = conn.prepareStatement(sql);
			// 5����ռλ����ֵ
			ps.setString(1, uname);
			// 6��ִ��sql
			rs = ps.executeQuery();
			// 6���������
			if (rs.next()) {
				u=new User();
				u.setUid(rs.getInt("uid"));
				u.setUname(rs.getString("uname"));
				u.setPrice(rs.getDouble("price"));
				u.setLoc(rs.getString("loc"));
				u.setDesc(rs.getString("desc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return u;
	}

}
