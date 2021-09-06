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

import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.Address;
import tanbao.entity.entitytable.Goods;
import tanbao.entity.entitytable.Order;
import tanbao.entity.entitytable.OrderDetail;
import tanbao.entity.entitytable.User;
import tanbao.service.AddressService;
import tanbao.service.GoodsService;
import tanbao.service.OrderService;
import tanbao.service.StoreService;
import tanbao.service.UserService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	
	/**
	 * 点单缓存数据
	 */
	private List<Address> listAddress = new ArrayList<Address>();
	private List<Goods> listGoods = new ArrayList<Goods>();
	private List<String> listNum = new ArrayList<String>();
	private OrderService orderService = new OrderService();
	private AddressService addressService = new AddressService();
	private UserService userService = new UserService();
	
	private Double orderPrice = new Double(0);
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String m = request.getParameter("m");
		switch (m) {
		case "orderAdd":
				orderAdd(request, response);
			break;
		
		case "orderDelete":
				orderDelete(request, response);	
			break;

		case "orderUpdate":
				orderUpdate(request, response);
			break;
		
		case "orderSelect":
				orderSelect(request, response);
			break;
		case "selectMyOrder":
				selectMyOrder(request,response);
			break;
		case "createOrder":
			createOrder(request,response);
			break;
		case "createOrderOne":
			createOrderOne(request,response);
			break;
		case "clearOrderData":
			clearOrderData(request,response);
			break;
		case "getOrderData":
			getOrderData(request,response);
			break;
		case "managerOrderSelect":
			ManagerOrderSelect(request,response);
			break;
		case "selectMyTuiKuanOrder":
			selectMyTuiKuanOrder(request,response);
			break;
		default:
			break;
		}
	}
	
	/**
	 * 从购物车获取数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void getOrderData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String goodsId = request.getParameter("goodsId");
		String num = request.getParameter("num");
		if(goodsId != null && num != null) {
			Goods goods = new GoodsService().select(goodsId);
			orderPrice = orderPrice + Double.parseDouble(goods.getGoodsOutPrice()) * Integer.parseInt(num);
			listGoods.add(goods);
			listNum.add(num);
			response.getWriter().print(listNum.size());
		}
	}

	/**
	 * 清除缓存订单数据
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void clearOrderData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean b = true;
		listGoods.clear();
		listAddress.clear();
		listNum.clear();
		orderPrice = 0.0;
		response.getWriter().print(b);
	}

	/**
	 *  从商品详情获取订单数据
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void createOrderOne(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		if(p != null) {
			LoginUser loginUser = (LoginUser)p;
			String goodsId = request.getParameter("goodsId");
			String num = request.getParameter("num");
			listGoods.clear();
			listAddress.clear();
			listNum.clear();
			orderPrice = 0.0;
			Goods goods = new GoodsService().select(goodsId);
			AddressService addressService = new AddressService();
			listGoods.add(goods);
			listNum.add(num);
			for(String a : loginUser.getMyAddress().keySet()) {
				listAddress.add(addressService.selectAddress(a));
			}
			orderPrice = Double.parseDouble(goods.getGoodsOutPrice())*Integer.parseInt(num);
			request.setAttribute("listNum", listNum);
			request.setAttribute("listGoods", listGoods);
			request.setAttribute("listAddress", listAddress);
			request.setAttribute("orderPrice", orderPrice.toString());
			request.getRequestDispatcher("/user/view/tijiaodingdan.jsp").forward(request, response);
		}else response.sendRedirect("/tanbao/login.jsp");
		
	}

	/**
	 * 预创订单
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void createOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		AddressService addressService = new AddressService();
		for(String a : loginUser.getMyAddress().keySet()) {
			listAddress.add(addressService.selectAddress(a));
		}
		request.setAttribute("listAddress", listAddress);
		request.setAttribute("listNum", listNum);
		request.setAttribute("listGoods", listGoods);
		request.setAttribute("orderPrice", orderPrice.toString());
		request.getRequestDispatcher("/user/view/tijiaodingdan.jsp").forward(request, response);
	}
	
	/**
	 * 获取订单信息
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException 
	 */
	private void selectMyOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		List<Order> listOrder = new ArrayList<Order>();
		List<Address> listAddress = new ArrayList<Address>();
		AddressService addressService = new AddressService();
		for(String orderId : loginUser.getMyOrderId()) {
			Order order = orderService.selectOrder(orderId);
			listOrder.add(order);
			listAddress.add(addressService.selectAddress(order.getAddressId()));
		}
		request.setAttribute("listOrder", listOrder);
		request.setAttribute("listAddress", listAddress);
		request.getRequestDispatcher("/user/view/jiaoyidindan.jsp").forward(request, response);
	}
	
	/**
	 * 获取退款订单信息
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void selectMyTuiKuanOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		List<Order> listOrder = new ArrayList<Order>();
		List<Address> listAddress = new ArrayList<Address>();
		List<Goods> lGoods = new ArrayList<Goods>();
		AddressService addressService = new AddressService();
		GoodsService goodsService = new GoodsService();
		for(String orderId : loginUser.getMyOrderId()) {
			Order order = orderService.selectOrder(orderId);
			listOrder.add(order);
			listAddress.add(addressService.selectAddress(order.getAddressId()));
			if(loginUser.getMyShopping().keySet() != null) {
				for(String i : loginUser.getMyShopping().keySet()) {
				}
			}
		}
		System.out.println(listAddress.size());
		System.out.println(listOrder.size());
		request.setAttribute("listOrder", listOrder);
		request.setAttribute("listAddress", listAddress);
		request.getRequestDispatcher("/user/view/tuihuo.jsp").forward(request, response);
	}
	
	/** 添加订单*/
	private void orderAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		if(p != null) {
			String addressId = request.getParameter("addressId");
			StoreService storeService = new StoreService();
			LoginUser loginUser = (LoginUser)p;
			HashMap<String,List<OrderDetail>> map = new HashMap<String,List<OrderDetail>>();
			for(int i = 0; i < listGoods.size(); i++) {
				String sellerId = storeService.selectSellerIdByGoodsId(listGoods.get(i).getGoodsId());
				if(!map.containsKey(sellerId))map.put(sellerId, new ArrayList<OrderDetail>());
				else {
					OrderDetail orderDetail = new OrderDetail(sellerId, listGoods.get(i).getGoodsId(), listNum.get(i));
					map.get(sellerId).add(orderDetail);
				}
			}
			for(String sel : map.keySet()) {
				Order order = new Order(null, loginUser.getMyInfo().getUserId(),sel, null, null, addressId);
				String id = orderService.add(order, map.get(sel));
				loginUser.getMyOrderId().add(id);
			}
			response.sendRedirect("/tanbao/user/view/admin.jsp");
		}else response.sendRedirect("/tanbao/login.jsp");
	}
	
	/** 删除订单*/
	private void orderDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String orderId = request.getParameter("orderId");
		boolean ret = orderService.deleteOrder(orderId);
		ManagerOrderSelect(request, response);
	}

	/** 修改订单*/
	private void orderUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		orderSelect(request, response);
	}

	/** 查询订单*/
	private void orderSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String orderId = request.getParameter("orderId");
		Order order = orderService.selectOrder(orderId);
		Address address = new AddressService().selectAddress(order.getAddressId());
		List<OrderDetail> listOrderDetail = orderService.selectOrderDetail(orderId);
		List<Goods> listGoods = new ArrayList<Goods>();
		List<String> listNum = new ArrayList<String>();
		GoodsService goodsService = new GoodsService();
		for(OrderDetail o : listOrderDetail) {
			listGoods.add(goodsService.select(o.getGoodsId()));
			listNum.add(o.getOrderNum());
		}
		request.setAttribute("listNum", listNum);
		request.setAttribute("order", order);
		request.setAttribute("address", address);
		request.setAttribute("listGoods", listGoods);
		request.getRequestDispatcher("/user/view/dingdanxiangqing.jsp").forward(request, response);
		
	}
	
	/** 查询订单 管理员查询*/
	private void ManagerOrderSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 List<Order> order = orderService.select();
		 List<User> user = new ArrayList<User>();
		 List<Address> address = new ArrayList<Address>();
		 String name = request.getParameter("name");
	        for(Order o : order) {
	        address.add(addressService.selectAddress(o.getAddressId()));
	        user.add(userService.selectByBuyId(o.getBuyId()));
	        }
	        request.setAttribute("Order", order);
	        request.setAttribute("User", user);
	        request.setAttribute("Address", address);
	        System.out.println(name);
	        if ("administrator".equals(name)) {
	        	request.getRequestDispatcher("/admin/view/order_list.jsp").forward(request, response);
			}else {							
				request.getRequestDispatcher("/manager/view/order_list_all.jsp").forward(request, response);
			}
		    
	}
	
}
