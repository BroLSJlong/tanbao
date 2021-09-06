package tanbao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.CollectionGoods;
import tanbao.entity.entitytable.CollectionStore;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.User;
import tanbao.service.CollectionService;
import tanbao.service.GoodsService;
import tanbao.service.StoreService;
import tanbao.service.UserService;

@WebServlet("/ColloctionServlet")
public class ColloctionServlet extends HttpServlet{
	private CollectionService collectionService = new CollectionService();
	private GoodsService goodsService = new GoodsService();
	private UserService userService = new UserService();
	private StoreService storeService = new StoreService();	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m = request.getParameter("m");
		switch(m) {
		case "getGoods":
			getGoods(request,response);
			break;
		case "getStore":
			getStore(request,response);
			break;
		case "deleteGood":
			deleteGood(request,response);
			break;
		case "deleteStore":
			deleteStore(request,response);
			break;
		case "deletStoreAll":
			deleteStoreAll(request,response);
			break;
		case "deletGoodsAll":
			deleteGoodsAll(request,response);
			break;
		case "addCollectionGoods":
			addCollectionGoods(request,response);
			break;
		case "isCollectionGoods":
			isCollectionGoods(request,response);
			break;
		}
	}
	
	private void isCollectionGoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object p = request.getSession().getAttribute("user");
		boolean b = false;
		LoginUser loginUser = null;
		if(p != null) {
			loginUser = (LoginUser)p;
			String goodsId = request.getParameter("goodsId");
			if(collectionService.isempty(new CollectionGoods(loginUser.getMyInfo().getUserId(),goodsId))) {
				b = true;
			}
		}
		response.getWriter().print(b);
	}

	private void addCollectionGoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object p = request.getSession().getAttribute("user");
		String id = request.getParameter("goodsId");
		LoginUser loginUser = null;
		boolean b = false;
		if(p != null && id != null) {
			loginUser = (LoginUser)p;
			collectionService.add(loginUser.getMyInfo().getUserId(), id, "Goods");
			b = true;
		}
		response.getWriter().print(b);
	}

	/**
	 * 删除全部的店家收藏
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void deleteStoreAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		collectionService.deleteByUserId(loginUser.getMyInfo().getUserId(), "Store");
		getGoods(request,response);
	}
	
	private void deleteGoodsAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		collectionService.deleteByUserId(loginUser.getMyInfo().getUserId(), "Goods");
		getGoods(request,response);
	}
	
	private void deleteStore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String goodId = request.getParameter("id");
		collectionService.delete(loginUser.getMyInfo().getUserId(), goodId, "Store");
		getStore(request,response);
	}

	/**
	 *  删除商品收藏
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void deleteGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String goodId = request.getParameter("id");
		collectionService.delete(loginUser.getMyInfo().getUserId(), goodId, "Goods");
		getGoods(request,response);
	}

	/**
	 * 获取收藏的商品并转到商品收藏页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = null;
		if(p != null) {
			loginUser = (LoginUser)p;
		}
		List<CollectionGoods> list = collectionService.selectGoodsId(loginUser.getMyInfo().getUserId());
		List<Goods> collectionGoods = new ArrayList<Goods>();
		for(CollectionGoods cg : list) {
			collectionGoods.add(goodsService.select(cg.getGoodsId()));
		}
		request.setAttribute("listGoods", collectionGoods);
		request.getRequestDispatcher("/user/view/myshoucang.jsp").forward(request, response);
	}
	
	/**
	 * 获取收藏的店铺并转到店铺收藏页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void getStore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		List<CollectionStore> list = collectionService.selectStoreId(loginUser.getMyInfo().getUserId());
		List<User> collectionUser = new ArrayList<User>();
		List<String> collectionStore = new ArrayList<String>();
		List<String> types = new ArrayList<String>();
		for(CollectionStore cs : list) {
			User user = userService.selectBySellerId(cs.getSellerId());
			collectionUser.add(user);
			String store = storeService.selectStore(cs.getSellerId());
			collectionStore.add(store);
			String type = storeService.selectStoreClass(cs.getSellerId());
			types.add(type);
		}
		request.setAttribute("listStore", collectionStore);
		request.setAttribute("listUser", collectionUser);
		request.setAttribute("types",types);
		request.getRequestDispatcher("/user/view/myshoucangdedianpu.jsp").forward(request, response);
	}
}
