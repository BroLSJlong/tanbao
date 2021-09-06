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

import sun.util.logging.resources.logging_it;
import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.Address;
import tanbao.service.AddressService;

/**
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	/** new出AddressService方法（后面补上）*/
	AddressService addressService = new AddressService();
	private static final long serialVersionUID = 1L;
	private static final String LoginUser = null;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String m = request.getParameter("m");
		switch (m) {
		case "addressAdd":
				addressAdd(request, response);
			break;
		
		case "addressDelete":
				addressDelete(request, response);	
			break;

		case "addressUpdate":
				addressUpdate(request, response);
			break;
		
		case "addressSelect":
				addressSelect(request, response);
			break;
		default:
			break;
		}
	}
	/** 增加地址*/
	private void addressAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String userId = request.getParameter("userId");
		String address = request.getParameter("address");
		String address1 = request.getParameter("address1");
		String address2 = address+address1;
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String ret = addressService.add(userId,address2,name,phone);
		loginUser.getMyAddress().put(ret, address2);
		addressSelect(request, response);
	}
	
	/** 删除地址*/
	private void addressDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String addressId = request.getParameter("addressId");
		loginUser.getMyAddress().remove(addressId);
		boolean ret = addressService.delete(addressId);
		addressSelect(request, response);
	}

	/** 修改地址*/
	private void addressUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		String userId = request.getParameter("userId");
		String addressId = request.getParameter("addressId");
		String address = request.getParameter("address");
		String address1 = request.getParameter("address1");
		String address2 = address+address1;
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		//封装成对象 后面补上
		Address addre = new Address(userId, addressId, address2, name, phone);
		boolean ret = addressService.update(addre);
		loginUser.getMyAddress().put(addressId, address);
		addressSelect(request, response);
	}

	/**  
	 *查询详细地址
	 */
	private void addressSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Object p = request.getSession().getAttribute("user");
		LoginUser loginUser = (LoginUser)p;
		ArrayList<Address> addresses = new ArrayList<Address>();
		AddressService addressService = new AddressService();
		if(loginUser.getMyAddress().keySet() != null) {
			for(String i : loginUser.getMyAddress().keySet()){
				Address addre = addressService.selectAddress(i);
				addresses.add(addre);
			}
		}
		
		System.out.println(addresses);
		System.out.println(p);
		request.setAttribute("addresses", addresses);
		request.getRequestDispatcher("/user/view/dizhiguanli.jsp").forward(request, response);
	}
	

}
