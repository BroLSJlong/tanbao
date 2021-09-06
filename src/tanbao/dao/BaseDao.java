package tanbao.dao;

import java.util.List;

import tanbao.entity.entitytable.Goods;

/**
 * 表的基本操作
 * @author ASUS
 *
 * @param <T>
 */
public interface BaseDao<T> {
	
	/**
	 * 查询所有
	 * @return
	 */
	public List selectAll();
	
	/**
	 * 查询一个
	 * @param id
	 * @return
	 */
	public T selectById(String id);
	
	/**
	 * 删除一个
	 * @param id
	 * @return
	 */
	public boolean deleteById(String id);
	
	/**
	 * 修改
	 * @param object
	 * @return
	 */
	public boolean updateById(T object);
	
	/**
	 * 添加
	 * @param object
	 * @return
	 */
	public boolean insert(T object);
}
