package tanbao.service;

import java.util.HashMap;
import java.util.List;

import tanbao.dao.AddressDao;
import tanbao.dao.GoodsImgDao;
import tanbao.dao.OrderDao;
import tanbao.dao.ShoppingDao;
import tanbao.dao.StoreDao;
import tanbao.dao.UserDao;
import tanbao.entity.LoginUser;
import tanbao.entity.MyStore;
import tanbao.entity.entitytable.User;

public class LoginService {
	
	/**
	 * 获取登录后的用户信息
	 * @param loginMessage 手机号或邮箱
	 * @param pwd 密码
	 * @return 手机号或密码不正确-返回null
	 */
	public LoginUser getUser(String loginMessage,String pwd) {
		LoginUser loginUser = null;
		User user = new User();
		user.setPhone(loginMessage);
		user.setEmail(loginMessage);
		user.setUserPwd(pwd);
		user = new UserDao().loginSelect(user,"phone");
		if(user.getUserId() == null)user = new UserDao().loginSelect(user,"email");
		if(user.getUserId() != null) {
			loginUser = new LoginUser();
			//封装用户信息
			loginUser.setMyInfo(user);
			//封装地址信息
			HashMap<String,String> address = new AddressDao().selectByUserId(user.getUserId());
			loginUser.setMyAddress(address);
			//封装订单信息
			List<String> orderIds = new OrderDao().selectOrderIdByBuyId(user.getUserId(),true);
			loginUser.setMyOrderId(orderIds);
			//封装购物车信息
			HashMap<String,String> shopping = new ShoppingDao().selectByUserId(user.getUserId());
			loginUser.setMyShopping(shopping);
			//封装店铺信息
			StoreDao storeDao = new StoreDao();
			String storeName = storeDao.selectNameBySellerId(user.getUserId());
			List<String> storeGoodsId = storeDao.selectBySellerId(user.getUserId());
			HashMap<String,List<String>> goodsImgs = new HashMap<String, List<String>>();
			String storeDescript = storeDao.selectDescriptBySellerId(user.getUserId());
			for(String id:storeGoodsId) {
				List<String> goodImgs = new GoodsImgDao().selectByGoodsId(id);
				goodsImgs.put(id, goodImgs);
			}
			List<String> storeOrderId = new OrderDao().selectOrderIdByBuyId(user.getUserId(), true);
			MyStore myStore = new MyStore(storeName, goodsImgs, storeOrderId,storeDescript);
			loginUser.setMyStore(myStore);
		}
		return loginUser;
	}
	
}
