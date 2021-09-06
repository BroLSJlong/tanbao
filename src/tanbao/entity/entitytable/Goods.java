package tanbao.entity.entitytable;

/**
 * 商品类
 * 对应商品表
 * @author 何崇宇
 *
 */
public class Goods {
	/**商品Id */
	private String goodsId;
	/**商品名 */
	private String goodsName;
	/**商品售价 */
	private String goodsOutPrice;
	/**商品售价 */
	private String goodsInPrice;
	/**商品简介 */
	private String goodsDescript;
	/**商品数量 */
	private String goodsNum;
	/**商品类型 */
	private String goodsClass;
	
	public Goods() {}
	
	public Goods(String goodsId, String goodsName, String goodsOutPrice, String goodsInPrice, String goodsDescript,
			String goodsNum, String goodsClass) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsOutPrice = goodsOutPrice;
		this.goodsInPrice = goodsInPrice;
		this.goodsDescript = goodsDescript;
		this.goodsNum = goodsNum;
		this.goodsClass = goodsClass;
	}

	public String getGoodsId() {
		return goodsId;
	}
	
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	public String getGoodsName() {
		return goodsName;
	}
	
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	public String getGoodsOutPrice() {
		return goodsOutPrice;
	}
	
	public void setGoodsOutPrice(String goodsOutPrice) {
		this.goodsOutPrice = goodsOutPrice;
	}
	
	public String getGoodsInPrice() {
		return goodsInPrice;
	}
	
	public void setGoodsInPrice(String goodsInPrice) {
		this.goodsInPrice = goodsInPrice;
	}
	
	public String getGoodsDescript() {
		return goodsDescript;
	}
	
	public void setGoodsDescript(String goodsDescript) {
		this.goodsDescript = goodsDescript;
	}
	
	public String getGoodsNum() {
		return goodsNum;
	}
	
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	
	public String getGoodsClass() {
		return goodsClass;
	}
	
	public void setGoodsClass(String goodsClass) {
		this.goodsClass = goodsClass;
	}
	
}
