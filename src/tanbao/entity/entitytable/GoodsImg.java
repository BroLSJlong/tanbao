package tanbao.entity.entitytable;

import java.util.List;

/**
 * 商品图片
 * @author 何崇宇
 *
 */
public class GoodsImg {
	/**商品id */
	private String goodsId;
	/**商品图片 */
	private String imgId;
	
	public GoodsImg() {}
	
	public GoodsImg(String goodsId, String imgId) {
		super();
		this.goodsId = goodsId;
		this.imgId = imgId;
	}

	public String getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getImgId() {
		return imgId;
	}
	
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	
}
