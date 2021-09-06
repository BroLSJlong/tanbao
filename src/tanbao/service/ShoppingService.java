package tanbao.service;

import java.util.HashMap;

import tanbao.dao.ShoppingDao;
import tanbao.entity.entitytable.Shopping;

public class ShoppingService {
	private ShoppingDao shoppingDao = new ShoppingDao();
	
	public boolean add(Shopping shopping) {
		return shoppingDao.insert(shopping);
	}
	
	public boolean delete(String goodsid) {
		return shoppingDao.deleteById(goodsid);
	}
	
	public HashMap<String,String> select(String userId) {
		return shoppingDao.selectByUserId(userId);
	}
	
	public boolean update(Shopping shopping) {
		return shoppingDao.updateById(shopping);
	}
}
