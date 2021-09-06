package tanbao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.Shopping;
import tanbao.service.GoodsService;
import tanbao.service.ShoppingService;

/**
 * Servlet implementation class ShoppingServlet
 */
@WebServlet("/ShoppingServlet")
public class ShoppingServlet extends HttpServlet {
	/** new出ShoppingService方法（后面补上）*/
	ShoppingService shoppingService = new ShoppingService();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String m = request.getParameter("m");
		switch (m) {
		case "shoppingAdd":
				shoppingAdd(request, response);
			break;
		case "shoppingDelete":
				shoppingDelete(request, response);	
			break;

		case "shoppingUpdate":
				shoppingUpdate(request, response);
			break;
		
		case "shoppingSelect":
				shoppingSelect(request, response);
			break;
		case "init":
				init(request,response);
			break;
		case "getListGoodsNum":
			getListGoodsNum(request,response);
		default:
			break;
		}
	}
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void getListGoodsNum(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<String> listNum = new ArrayList<String>();
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		for(String s : loginUser.getMyShopping().keySet()) {
			listNum.add(loginUser.getMyShopping().get(s));
		}
		String json = new Gson().toJson(listNum);
		response.getWriter().print(json);
	}
	
	/**
	 * 查看商品是否被收藏
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void init(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String id = request.getParameter("goodsId");
		boolean b = false;
		if(loginUser != null) {
			if(loginUser.getMyShopping().containsKey(id)) {
				b = true;
			}
		}
		response.getWriter().print(b);
	}

	/** 增加购物车（的商品）*/
	private void shoppingAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		
		String id = request.getParameter("goodsId");
		String num = request.getParameter("num");
		boolean ret = false;
		if(loginUser != null && id != null) {
			Shopping shopping = new Shopping(loginUser.getMyInfo().getUserId(), id, num);
			ret = shoppingService.add(shopping);
			loginUser.getMyShopping().put(id, num);
		}
		response.getWriter().print(ret);
		
	}
	
	/** 删除购物车商品*/
	private void shoppingDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String goodsId = request.getParameter("goodsId");
		loginUser.getMyShopping().remove(goodsId);
		//通过goodsId删除购物车的 商品
		boolean ret = shoppingService.delete(goodsId);
		shoppingSelect(request, response);
	}

	/** 修改购物车*/
	private void shoppingUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String userId = request.getParameter("userId");
		String goodsId = request.getParameter("goodsId");
		String shopNum = request.getParameter("shopNum");
		
		Shopping shopping = new Shopping(userId, goodsId, shopNum);
		boolean ret = shoppingService.update(shopping);
		shoppingSelect(request, response);
	}

	/** 查询购物车*/
	private void shoppingSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		List<Goods> lGoods = new ArrayList<Goods>();
		GoodsService goodsService = new GoodsService();
		if(loginUser.getMyShopping().keySet() != null) {
			for(String i : loginUser.getMyShopping().keySet()) {
				Goods goods = goodsService.select(i);
				lGoods.add(goods);
			}
		}
		request.setAttribute("goodsList", lGoods);
		//加入连接
		request.getRequestDispatcher("/user/view/gouwuche.jsp").forward(request, response);
	}
	
}
