package tanbao.service;

import java.util.List;

import tanbao.dao.CollectionGoodsDao;
import tanbao.dao.CollectionStoreDao;
import tanbao.entity.entitytable.CollectionGoods;
import tanbao.entity.entitytable.CollectionStore;

public class CollectionService {
	private CollectionGoodsDao collectionGoodsDao = new CollectionGoodsDao();
	private CollectionStoreDao collectionStoreDao = new CollectionStoreDao();
	
	/**
	 * 
	 * @param userId 用户Id
	 * @param collectionId "GoodsId" "sellerId"
	 * @param method "Goods"删除商品售出 "Store"删除商店收藏
	 * @return
	 */
	public boolean delete(String userId,String collectionId ,String method) {
		if("Goods".equals(method)) {
			return collectionGoodsDao.deleteByIds(new CollectionGoods(userId, collectionId));
		}else {
			return collectionStoreDao.deleteByIds(new CollectionStore(userId, collectionId));
		}
	}
	
	/**
	 * 删除用户全部收藏
	 * @param userId 用户Id
	 * @param method "Goods"删除商品售出 "Store"删除商店收藏
	 * @return
	 */
	public boolean deleteByUserId(String userId,String method) {
		if("Goods".equals(method)) {
			return collectionGoodsDao.deleteByUserId(userId);
		}else return collectionStoreDao.deleteByUserId(userId);
	}
	
	/**
	 * 
	 * @param userId 用户Id
	 * @param collectionId "GoodsId" "sellerId"
	 * @param method "Goods"删除商品售出 "Store"删除商店收藏
	 * @return
	 */
	public boolean add(String userId,String collectionId ,String method) {
		if("Goods".equals(method)) {
			return collectionGoodsDao.insert(new CollectionGoods(userId, collectionId));
		}else {
			return collectionStoreDao.insert(new CollectionStore(userId, collectionId));
		}
	}
	
	/**
	 * @param userId 用户Id
	 * @return List<CollectionGoods>
	 */
	public List<CollectionGoods> selectGoodsId(String userId) {
		return collectionGoodsDao.selectByUserId(userId);
	}
	
	/**
	 * @param userId 用户Id
	 * @return List<CollectionStore>
	 */
	public List<CollectionStore> selectStoreId(String userId) {
		return collectionStoreDao.selectByUserId(userId);
	}
	
	public boolean isempty(CollectionGoods collectionGoods) {
		return collectionGoodsDao.isempty(collectionGoods);
	}
}
