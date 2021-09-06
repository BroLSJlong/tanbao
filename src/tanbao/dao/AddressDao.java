package tanbao.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import tanbao.entity.entitytable.Address;
import tanbao.util.JDBCUtil;

public class AddressDao implements BaseDao<Address>{
	
/**
 * 全部查询
 */
	@Override
	public ArrayList<Address> selectAll() {
		ArrayList<Address> list = new ArrayList<Address>();
		try {
		Connection co = JDBCUtil.getConnection();
		Statement stmt =  co.createStatement();
		ResultSet rs =  stmt.executeQuery("select userId,addressId,address,name,phone from addresstable");
		while(rs.next()) {
			String userid = rs.getString("userId");
			String addressid = rs.getString("addressId");
			String address = rs.getString("address");
			String name = rs.getString("name");
			String phone = rs.getString("phone");
			 Address address1 = new Address(userid,addressid,address,name,phone);
			 list.add(address1);
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
	@Override
	public Address selectById(String id) {
		Address address = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select userId,addressId,address,name,phone from addresstable where addressId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				String userId = rs.getString("userId");
				String addressId = rs.getString("addressId");
				String address1 = rs.getString("address");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				address = new Address(userId,addressId,address1,name,phone);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return address;
	}
	
	/**
	 * 根据用户id查询
	 * @param id List
	 * @return
	 */
	public HashMap<String,String> selectByUserId(String id){
		HashMap<String,String> map = null;
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("select address,addressId from addresstable where userId = ?");
			stmt.setString(1,id);
			ResultSet rs = stmt.executeQuery();
			map = new HashMap<String,String>();
			while(rs.next()) {
				String addressId = rs.getString("addressId");
				String address1 = rs.getString("address");
				map.put(addressId, address1);
			}
			JDBCUtil.closeConnection(co);
			}catch (SQLException e) {
				e.printStackTrace();
			}
		return map;
	}
	
	/**
	 * 删除
	 */
	public boolean deleteById(String id) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt =  co.prepareStatement("delete from addresstable where addressId = ?");
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
	public boolean updateById(Address address) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update addresstable set userId = ?,addressId = ?,address = ?,name = ?,phone = ? where addressId = ?");
			stmt.setString(1,address.getUserId());
			stmt.setString(2,address.getAddressId());
			stmt.setString(3,address.getAddress());
			stmt.setString(4,address.getName());
			stmt.setString(5,address.getPhone());
			stmt.setString(6,address.getAddressId());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	public boolean updateOrderAddressById(Address address) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update addresstable set address = ?,name = ? where addressId = ?");
			stmt.setString(1,address.getAddress());
			stmt.setString(2,address.getName());
			stmt.setString(3,address.getAddressId());
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
	public boolean insert(Address address) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("insert into  addresstable(userId,addressId,address,name,phone) values (?,?,?,?,?)");
			stmt.setString(1,address.getUserId());
			stmt.setString(2,address.getAddressId());
			stmt.setString(3,address.getAddress());
			stmt.setString(4,address.getName());
			stmt.setString(5,address.getPhone());
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	/**
	 * 删除后更新userId为空
	 */
	public boolean updateByIdDeUserId(String addressId) {
		try {
			Connection co = JDBCUtil.getConnection();
			PreparedStatement stmt = co.prepareStatement
("update addresstable set userId = ? where addressId = ?");
			stmt.setString(1,null);
			stmt.setString(2,addressId);
			int r = stmt.executeUpdate();
			JDBCUtil.closeConnection(co);
			return r>0;

		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		return false;
	}

}
