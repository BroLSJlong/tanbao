package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tanbao.entity.entitytable.User;
import tanbao.util.JDBCUtil;

public class UserDao implements BaseDao<User>{
	/**
	 * 全部查询
	 */
	public List<User> selectAll() {
		ArrayList<User> list = new ArrayList<User>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select userId,userName,phone,userPwd,userSex,userBorn,idCard,email,headImg,userClass from usertable ");
		while(rs.next()) {
			String userid = rs.getString("userId");
			String username = rs.getString("userName");
			String phone = rs.getString("phone");
			String userpwd = rs.getString("userPwd");
			String usersex = rs.getString("userSex");
			String userborn = rs.getString("userBorn");
			String idcard = rs.getString("idCard");
			String email = rs.getString("email");
			String headimg = rs.getString("headImg");
			String userclass = rs.getString("userClass");
			 User user = new User(userid,username,phone,userpwd,usersex,userborn,idcard,email,headimg,userclass);
			 list.add(user);
		}
		JDBCUtil.closeConnection(co);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 单个查询
	 */
	public User selectById(String id) {
		User user = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select userId,userName,phone,userPwd,userSex,userBorn,idCard,email,headImg,userClass from usertable where userId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String userid = rs.getString("userId");
				String username = rs.getString("userName");
				String phone = rs.getString("phone");
				String userpwd = rs.getString("userPwd");
				String usersex = rs.getString("userSex");
				String userborn = rs.getString("userBorn");
				String idcard = rs.getString("idCard");
				String email = rs.getString("email");
				String headimg = rs.getString("headImg");
				String userclass = rs.getString("userClass");
		       user = new User(userid,username,phone,userpwd,usersex,userborn,idcard,email,headimg,userclass);
			}
			JDBCUtil.closeConnection(co);
			}catch (Exception e) {
				e.printStackTrace();
			}
		return user;
	}

	/**
	 *手机查询人
	 */
	public List<User> selectByid(String ph) {
		User user = null;
		List<User> list = new ArrayList<User>();
		try {
			Connection co = JDBCUtil.getConnection();
		
			PreparedStatement stmt =  co.prepareStatement("select userId,userName,phone,userPwd,userSex,userBorn,idCard,email,headImg,userClass from usertable where phone = ?");
			stmt.setString(1,ph);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				
				String userid = rs.getString("userId");
				String username = rs.getString("userName");
				String phone = rs.getString("phone");
				String userpwd = rs.getString("userPwd");
				String usersex = rs.getString("userSex");
				String userborn = rs.getString("userBorn");
				String idcard = rs.getString("idCard");
				String email = rs.getString("email");
				String headimg = rs.getString("headImg");
				String userclass = rs.getString("userClass");
		        user = new User(userid,username,phone,userpwd,usersex,userborn,idcard,email,headimg,userclass);
		        list.add(user);
		       
			}
			JDBCUtil.closeConnection(co);
			}catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}

	public  List<User> selectAll2() {
		List<User> list = new ArrayList<User>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select userId,userName,phone,userPwd,userSex,userBorn,idCard,email,headImg,userClass from usertable ");
		while(rs.next()) {
			String userid = rs.getString("userId");
			String username = rs.getString("userName");
			String phone = rs.getString("phone");
			String userpwd = rs.getString("userPwd");
			String usersex = rs.getString("userSex");
			String userborn = rs.getString("userBorn");
			String idcard = rs.getString("idCard");
			String email = rs.getString("email");
			String headimg = rs.getString("headImg");
			String userclass = rs.getString("userClass");
			 User user = new User(userid,username,phone,userpwd,usersex,userborn,idcard,email,headimg,userclass);
			 list.add(user);
		}
		JDBCUtil.closeConnection(co);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from usertable where userId = ?");
			stmt.setString(1,id);
			int rs = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return rs>0;
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
	}

	/**
	 * 更新
	 */
	public boolean updateById(User user) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update usertable set userId = ?,userName = ?,phone = ?,userPwd = ?,userSex = ? ,userBorn = ? ,idCard = ? ,email = ? ,headImg = ? ,userClass = ? where userId = ?");
			stmt.setString(1,user.getUserId());
			stmt.setString(2,user.getUserName());
			stmt.setString(3,user.getPhone());
			stmt.setString(4,user.getUserPwd());
			stmt.setString(5,user.getUserSex());
			stmt.setString(6,user.getUserBorn());
			stmt.setString(7,user.getIdCard());
			stmt.setString(8,user.getEmail());
			stmt.setString(9,user.getHeadImg());
			stmt.setString(10,user.getUserClass());
			stmt.setString(11,user.getUserId());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

	/**
	 * 增加
	 */
	public boolean insert(User user) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("insert into  usertable(userId,userName,phone,userPwd,userSex,userBorn,idCard,email,headImg,userClass) values (?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1,user.getUserId());
			stmt.setString(2,user.getUserName());
			stmt.setString(3,user.getPhone());
			stmt.setString(4,user.getUserPwd());
			stmt.setString(5,user.getUserSex());
			stmt.setString(6,user.getUserBorn());
			stmt.setString(7,user.getIdCard());
			stmt.setString(8,user.getEmail());
			stmt.setString(9,user.getHeadImg());
			stmt.setString(10,user.getUserClass());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

	/**
	 * 修改用户头像
	 */
	public boolean updateUserHeadImg(User user) {
		Connection co = null;
		try {
			String sql = "update usertable set headImg = ? where userId = ?";
			co = JDBCUtil.getConnection();
			PreparedStatement pst = co.prepareStatement(sql);
			pst.setObject(1, user.getHeadImg());
			pst.setObject(2, user.getUserId());
			int ret = pst.executeUpdate();
			
			return ret > 0;
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeConnection(co);
		}
		return false;
	}

	/**
	 * 登录（根据账号密码）
	 * @param method ('phone','email')
	 */
	public User loginSelect(User user,String method) {
		try {
			Connection co = JDBCUtil.getConnection();
			String sql = "select userId,userName,phone,userPwd,userSex,userBorn,idCard,email,headImg,userClass from usertable where userPwd = ? ";
			if("phone".equals(method)) sql = sql + " and phone = ?";
			else sql = sql + "and email = ?";
			PreparedStatement stmt =  co.prepareStatement(sql);
			stmt.setString(1,user.getUserPwd());
			if("phone".equals(method)) stmt.setString(2,user.getPhone());
			else stmt.setString(2, user.getEmail());
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String userid = rs.getString("userId");
				String username = rs.getString("userName");
				String phone = rs.getString("phone");
				String userpwd = rs.getString("userPwd");
				String usersex = rs.getString("userSex");
				String userborn = rs.getString("userBorn");
				String idcard = rs.getString("idCard");
				String email = rs.getString("email");
				String headimg = rs.getString("headImg");
				String userclass = rs.getString("userClass");
		        user = new User(userid,username,phone,userpwd,usersex,userborn,idcard,email,headimg,userclass);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return user;
	}
	
	
}
