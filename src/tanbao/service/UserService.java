package tanbao.service;

import java.util.List;

import tanbao.dao.UserDao;
import tanbao.entity.entitytable.User;
import tanbao.util.UUIDUtil;

public class UserService {
	private UserDao userDao = new UserDao();

	/**
	 * 添加
	 * @param user (Id设为null)
	 * @return
	 */
	public boolean add(User user) {
		String id = UUIDUtil.getUUID();
		user.setUserId(id);
		return userDao.insert(user);
	}
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public boolean update(User user) {
		return userDao.updateById(user);
	}

	/**
	 * 销毁用户，只有管理员使用
	 * @return
	 */
	public boolean delete(String userId) {
		return userDao.deleteById(userId);
	}
	
	/**
	 * 修改用户头像
	 */
	public boolean updateUserHeadImgService(User user) {
		return userDao.updateUserHeadImg(user);
	}
	
	/**
	 * 为测试而补的临时代码
	 * @return
	 */
	public List<User> select() {
		return userDao.selectAll2();
	}
	
	/**
	 *  从卖方Id拿User
	 *
	 */
	public User selectBySellerId(String id){
		return userDao.selectById(id);
	}
	
	/**
	 * 从买方Id拿User
	 * @param id
	 * @return
	 */
	public User selectByBuyId(String id){
		return userDao.selectById(id);
	}
	
	public List<User> userSelectbyph(String userId) {
		return userDao.selectByid(userId);
	}
}
