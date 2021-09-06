package tanbao.service;

import java.util.HashMap;

import tanbao.dao.AddressDao;
import tanbao.entity.entitytable.Address;
import tanbao.util.UUIDUtil;

public class AddressService {
	private AddressDao addressDao = new AddressDao();
	
	/**
	 * 新增地址
	 * @param userId 用户的Id
	 * @param address 地址详情内容
	 * @param name 收件人
	 * @param phone 手机号
	 * @return 是否添加成功
	 */
	public String add(String userId,String address,String name,String phone){
		String addressId = UUIDUtil.getUUID();
		Address myAddress = new Address(userId,addressId,address,name,phone);
		addressDao.insert(myAddress);
		return addressId;
	}
	
	/**
	 * 删除地址
	 * @param addressId
	 * @return
	 */
	public boolean delete(String addressId) {
		return addressDao.updateByIdDeUserId(addressId);
	}
	
	/**
	 * 更新地址信息
	 * @param addressId
	 * @param address
	 * @param name
	 * @param phone
	 * @return
	 */
	public boolean update(Address address) {
		return addressDao.updateById(address);
	}
	
	public boolean updateOrderAddress(Address address) {
		return addressDao.updateOrderAddressById(address);
	}
	/**
	 * 获取用户详情地址
	 * @param userId
	 * @return
	 */
	public HashMap<String,String> select(String userId){
		return addressDao.selectByUserId(userId);
	}
	
	/**
	 * 根据地址id获取地址
	 * @param id
	 * @return
	 */
	public Address selectAddress(String id) {
		return addressDao.selectById(id);
	}
	
}