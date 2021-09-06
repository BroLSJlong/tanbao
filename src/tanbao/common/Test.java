package tanbao.common;

import java.util.List;

import tanbao.dao.GoodsImgDao;
import tanbao.entity.entitytable.GoodsImg;
import tanbao.servlet.GoodsServlet;

public class Test {
public static void main(String[] args) {
	GoodsImgDao goodsImgDao = new GoodsImgDao();
	List<GoodsImg> goodsImgSelect = goodsImgDao.selectAllImg();
	System.out.println(goodsImgSelect);
}
}
