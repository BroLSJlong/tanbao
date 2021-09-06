package tanbao.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.GoodsImg;
import tanbao.service.GoodsService;
import tanbao.util.UUIDUtil;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet(value="/GoodsServlet",loadOnStartup=1)
public class GoodsServlet extends HttpServlet {
	
	/** new出GoodsService方法*/
	GoodsService goodsService = new GoodsService();
	
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String m = request.getParameter("m");
		switch (m) {
		case "goodsAdd":
				goodsAdd(request, response);
			break;
		
		case "goodsDelete":
				delete(request, response);	
			break;

		case "goodsUpdate":
				goodsUpdate(request, response);
			break;
		
		case "addImg":
				addImg(request, response);
			break;
		case "goodsSelectByName":
				goodsSelectByName(request, response);
			break;
		case "select":
			select(request, response);
			break;
		case "selectAll":
				goodsSelect(request, response);
			break;
		case "randomSelect":
				randomSelect(request, response);
			break;
		case "goodImgSelect":
			goodImgSelect(request, response);
			break;
		case "goodsImgAll":
			goodsImgAll(request, response);
			break;
		case "selectAdmin":
			goodsSelect_admin(request, response);
			break;
		case "goodsImgAllFenlei":
			goodsImgAllFenlei(request, response);
			break;
		case "goodsImgAllGWC":
			goodsImgAllGWC(request, response);
			break;
		case "goodsImgAllGoods":
			goodsImgAllGoods(request, response);
			break;
		case "goodsImgAllManager":
			goodsImgAllManager(request, response);
			break;
		case "goodsSelectByName_admin":
			goodsSelectByName_admin(request, response);
			break;
		case "deleteGoodsImg":
			deleteGoodsImg(request,response);
			break;
		default:
			break;
		}
	}
	
	/**
	 * 删除图片
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void deleteGoodsImg(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String imgId = request.getParameter("imgId");
		boolean b = goodsService.deleteImg(imgId);
		response.getWriter().print(b);
	}
	
	/** 增加商品(不包括图片)*/
	private void goodsAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String goodsId = UUIDUtil.getUUID();
		request.getSession().setAttribute("goodsId", goodsId);
		String goodsName = request.getParameter("goodsName");
		String goodsOutPrice = request.getParameter("goodsOutPrice");
		String goodsInPrice = request.getParameter("goodsInPrice");
		String goodsDescript = request.getParameter("goodsDescript");
		String goodsNum = request.getParameter("goodsNum");
		String goodsClass = request.getParameter("goodsClass");
		String imgId = (String) request.getSession().getAttribute("goodsImg");
		Goods goods = new Goods(goodsId, goodsName, goodsOutPrice, goodsInPrice, goodsDescript, goodsNum, goodsClass);
		boolean ret = goodsService.add(goods);
		System.out.println(goodsName);
		System.out.println(goodsOutPrice);
		System.out.println(goodsInPrice);
		System.out.println(goodsNum);
		System.out.println(goodsClass);
		System.out.println(goodsDescript);
		System.out.println(goodsId);
		if(ret) {
			System.out.println("成功");
		}else {
			System.out.println("失败");
		}
		request.getRequestDispatcher("/manager/view/product_add.jsp").forward(request, response);
	}
	
	private void goodsSelect_admin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//获取店铺的id，以便查询该店铺的所有商品
		String sellerId = request.getParameter("userId");
		List<Goods> goodsSelect_admin = goodsService.selectAll_admin();
		String name = request.getParameter("name");
		request.setAttribute("goods", goodsSelect_admin);
		if ("listAll_admin".equals(name)) {
			request.getRequestDispatcher("/admin/view/product_list.jsp").forward(request, response);
		}
	}
	/** 添加商品图片
	 * 
	 */
	private void addImg (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		String imgId = (String) request.getSession().getAttribute("goodsImg");
		HttpSession session = request.getSession();
		GoodsImg goodsImg = (GoodsImg)session.getAttribute("goodsImg");
	}
	
	/** 删除商品*/
	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String goodsId = request.getParameter("goodsId");
		boolean ret = goodsService.delete(goodsId);
//		List<Goods> goodsSelect = goodsService.selectAll();
//		request.setAttribute("goods", goodsSelect);
		if (ret) {
			request.getRequestDispatcher("/manager/view/product_list_all.jsp").forward(request, response);
		}
	}

	/** 修改商品*/
	private void goodsUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String goodsId = request.getParameter("goodsId");
		String goodsName = request.getParameter("goodsName");
		String goodsOutPrice = request.getParameter("goodsOutPrice");
		String goodsInPrice = request.getParameter("goodsInPrice");
		String goodsDescript = request.getParameter("goodsDescript");
		String goodsNum = request.getParameter("goodsNum");
		String goodsClass = request.getParameter("goodsClass");
		Goods goods = new Goods(goodsId,goodsName,goodsOutPrice ,goodsInPrice,goodsDescript,goodsNum,goodsClass);
		boolean ret = goodsService.update(goods);
		
	}

	/** 查询全部商品*/
	private void goodsSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//获取店铺的id，以便查询该店铺的所有商品
		String sellerId = request.getParameter("userId");
		List<Goods> goodsSelect = goodsService.selectAll();
		String name = request.getParameter("name");
		request.setAttribute("goods", goodsSelect);
		if ("listAll".equals(name)) {
			request.getRequestDispatcher("/manager/view/product_list_all.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
	
	/** 查询一个商品的（全部）图片*/
	public void goodImgSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//获取商品的id，以便查询该商品的所有图片
		String id = request.getParameter("goodId");
		List<String> goodsImgSelect = goodsService.selectGoodImgs(id);
		String json = new Gson().toJson(goodsImgSelect);
		response.getWriter().print(json);	
	}
	
	/** 查询全部图片index/gwc*/
	public void goodsImgAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<GoodsImg> goodsImgSelect = goodsService.selectAllImgs();
		request.setAttribute("goodsImg", goodsImgSelect);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	/** 查询全部图片fenlei*/
	public void goodsImgAllFenlei(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<GoodsImg> goodsImgSelect = goodsService.selectAllImgs();
		request.setAttribute("goodsImg", goodsImgSelect);
		request.getRequestDispatcher("fenlei.jsp").forward(request, response);
	}
	
	/** 查询全部图片gwc*/
	public void goodsImgAllGWC(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<GoodsImg> goodsImgSelect = goodsService.selectAllImgs();
		request.setAttribute("goodsImg", goodsImgSelect);
		String name = request.getParameter("name");
		if ("shoucang".equals(name)) {
			request.getRequestDispatcher("/user/view/myshoucang.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/user/view/gouwuche.jsp").forward(request, response);
		}
	}
	
	/** 查询全部图片goods*/
	public void goodsImgAllGoods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<GoodsImg> goodsImgSelect = goodsService.selectAllImgs();
		request.setAttribute("goodsImg", goodsImgSelect);
		String name = request.getParameter("name");
		if ("dingdan".equals(name)) {
			request.getRequestDispatcher("/user/view/tijiaodingdan.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("goods.jsp").forward(request, response);
		}
	}
	
	/** 查询全部图片manager*/
	public void goodsImgAllManager(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<GoodsImg> goodsImgSelect = goodsService.selectAllImgs();
		request.setAttribute("goodsImg", goodsImgSelect);
		request.getRequestDispatcher("/manager/view/product_list_all.jsp").forward(request, response);
	}
	
	/**
	 * 查询单个商品
	 */
	private void select(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("goodsId");
		Goods goods = goodsService.select(id);
		request.setAttribute("goods", goods);
		request.getRequestDispatcher("/goods.jsp").forward(request, response);
	}
	
	/** 模糊搜索商品（用户通过商品名字搜索）*/
	private void goodsSelectByName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//通过名为keywords的文本框拿到文本框的内容
		String keywords = request.getParameter("keywords");
		List<Goods> goods = goodsService.queryByName(keywords);
		List<String> show = getRandomGoodsClass();
		request.setAttribute("types", show);
		request.setAttribute("goods", goods);
		String name = request.getParameter("name");
		if ("produce_list_all".equals(name)) {
			request.getRequestDispatcher("/manager/view/product_list_all.jsp").forward(request, response);
		}else
		request.getRequestDispatcher("fenlei.jsp").forward(request, response);
	}
	
	/**
	 * 模糊查找
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void goodsSelectByName_admin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//通过名为keywords的文本框拿到文本框的内容
		String keywords = request.getParameter("keywords");
		List<Goods> goods = goodsService.queryByName_admin(keywords);
		List<String> show = getRandomGoodsClass();
		request.setAttribute("types", show);
		request.setAttribute("goods", goods);
		String name = request.getParameter("name");
		if ("product_list".equals(name)) {
			request.getRequestDispatcher("/admin/view/product_list.jsp").forward(request, response);
		}else
		request.getRequestDispatcher("fenlei.jsp").forward(request, response);
	}
	/**
	 * 随机获取6种商品
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void randomSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> show = getRandomGoodsClass();
		HashMap<String,List<Goods>> res = new  HashMap<String, List<Goods>>();
		Object p = request.getParameter("type");
		String type = (String)p;
		if(type == null) {
			type = show.get(0);
		}
		request.setAttribute("type",type);
		request.setAttribute("types", show);
		request.setAttribute("goods", goodsService.selectByGoodsClass(type));
		request.getRequestDispatcher("fenlei.jsp").forward(request, response);
	}
	
	/**
	 * 随机获取种类型(商品)
	 * @return
	 */
	public List<String> getRandomGoodsClass() {
		List<String> show = new ArrayList<String>();
		List<String> goodsClass = goodsService.selectClass();
		while(show.size() != 6 && goodsClass.size() != 0) {
			int i = (int) (Math.random()*goodsClass.size()); 
			show.add(goodsClass.get(i));
			goodsClass.remove(i);
		}
		return show;
	}
}
