package tanbao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.Store;
import tanbao.service.GoodsService;
import tanbao.service.LoginService;
import tanbao.service.StoreService;

/**
 * Servlet implementation class StoreServlet
 */
@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	/** new出storeService方法（后面补上）*/
	StoreService storeService = new StoreService();
	private List<Goods> listGoods = null;
	private static final long serialVersionUID = 1L;

	private String sellerId = null;
	private String storeName = null;
	private String storeDescript = null;
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String m = request.getParameter("m");
		switch (m) {
		case "storeAdd":
				storeAdd(request, response);
			break;
		case "storeDelete":
				storeDelete(request, response);	
			break;

		case "storeUpdate":
				storeUpdate(request, response);
			break;
		case "storeSelectByName":
			storeSelectByName(request, response);
			break;
		case "storeSelectAll":
			storeSelectAll(request,response);
			break;
		case "selectStore":
			selectStore(request,response);
			break;
		case "getGoodsImg":
			getGoodsImg(request,response);
			break;
		case "selectStoreGoods":
			selectStoreGoods(request,response);
			break;
		case "toStore":
			toStore(request,response);
			break;
		default:
			break;
		}
	}
	
	/**
	 * 从商品进入到店铺
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void toStore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String goodsId = request.getParameter("goodsId");
		String sellerId = storeService.selectSellerIdByGoodsId(goodsId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(sellerId);
	}

	private void selectStoreGoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Goods> res = new ArrayList<Goods>();
		String keywords = request.getParameter("keywords");
		for(Goods g : listGoods) {
			if(g.getGoodsName().indexOf(keywords) != -1) {
				res.add(g);
			}
		}
		String json = new Gson().toJson(res);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(json);
	}

	private void getGoodsImg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("goodsId");
		GoodsService goodsService = new GoodsService();
		String img = goodsService.selectOneImgById(id);
		if(img!=null) {
			img = "/tanbao/userImgs/"+img+".jpg";
		}else img = "img/logo2.jpg";
		response.getWriter().print(img);
	}

	/**
	 * 获取店铺信息
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void selectStore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sellerId = request.getParameter("sellerId");
		Store store = storeService.selectStoreById(sellerId);
		String storeType = storeService.selectStoreClass(sellerId);
		request.setAttribute("store", store);
		request.setAttribute("storeType", storeType);
		request.getRequestDispatcher("dianpu.jsp").forward(request, response);
	}
	
	/**
	 * 获取店里全部商品
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void storeSelectAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String sellerId = request.getParameter("sellerId");
		List<String> goodsId = storeService.select(sellerId);
		listGoods = new ArrayList<Goods>();
		GoodsService goodsService = new GoodsService();
		for(String id : goodsId) {
			listGoods.add(goodsService.select(id));
		}
		Gson g = new Gson();
		String json = g.toJson(listGoods);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(json);
	}
	
	/** 增加店铺*/
	private void storeAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String sellerId = request.getParameter("userId");
		String storeName = request.getParameter("storeName");
		String storeDescript = request.getParameter("storeDescript");
		Store store = new Store(sellerId, null, storeName,storeDescript);
		/**校验是否已拥有店铺*/
		boolean res = storeService.ifhasstore(sellerId);
		if (res) {
			boolean update = storeService.updateStore(store);
			
		}else {
				/**添加店铺*/
			boolean ret = storeService.addStore(store);
				
		}
	}
	
	/** 删除店铺*/
	private void storeDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String userId = request.getParameter("userId");
		String goodsId = request.getParameter("goodsId");
		boolean ret = storeService.delete(goodsId);
	}

	/** 修改店铺*/
	private void storeUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String userId = request.getParameter("userId");
		String goodsId = request.getParameter("goodsId");
		String storeName = request.getParameter("storeName");
		String storeDescript = request.getParameter("storeDescript");
		//没调用店铺修改
	}

	/** 查询(全部)店铺*/
/*	private void storeSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<String> storeSelect = storeService.select();
		request.setAttribute("stores",storeSelect);
		//加入连接
		request.getRequestDispatcher("").forward(request, response);
	}*/
	
	/**
	 * 添加店铺商品
	 */
	public void addOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
	}
	
	/** 模糊查询店铺*/
	@SuppressWarnings("unused")
	private void storeSelectByName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//通过名为keywords的文本框拿到文本框的内容
		String keywords = request.getParameter("keywords");
		List<String> sellerId = storeService.select(keywords);
		request.setAttribute("list", sellerId);
		request.getRequestDispatcher("").forward(request, response);
	}

}
