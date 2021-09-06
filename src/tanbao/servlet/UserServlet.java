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

import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.User;
import tanbao.service.LoginService;
import tanbao.service.UserService;
import tanbao.util.UUIDUtil;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	UserService userService = new UserService();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String m=null;
		 m = request.getParameter("m");
		switch (m) {
		case "userAdd":
				userAdd(request, response);
			break;		
		case "userDelete":
				userDelete(request, response);	
			break;

		case "userUpdate":
				userUpdate(request, response);
			break;
		
		case "userSelect":
				userSelect(request, response);
			break;
		case "userSelectbyph":
				userSelectbyph(request, response);
				break;
		}
	}
	/** 增加用户*/
	private void userAdd(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String userId = UUIDUtil.getUUID();
		request.getSession().setAttribute("userId",userId);
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userPwd = request.getParameter("userPwd");
		String userSex = request.getParameter("userSex");
		String userBorn = request.getParameter("userBorn");
		String idCard = request.getParameter("idCard");
		String email = request.getParameter("email");
		String headImg = request.getParameter("headImg");
		String userClass = request.getParameter("userClass");
		//调用GoodsService中的add方法
		User user = new User(null,userName,userPhone,userPwd,userSex,userBorn,idCard,email,headImg,userClass);
		boolean ret =  userService.add(user);
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}
	
	/** 删除用户*/
	private void userDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String userId = request.getParameter("userId");
		boolean ret = userService.delete(userId);
		userSelect(request, response);
	}

	/** 修改用户*/
	private void userUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		LoginUser u = (LoginUser)session.getAttribute("user");
		String userId = u.getMyInfo().getUserId();
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userPwd = request.getParameter("userPwd");
		String userSex = request.getParameter("userSex");
		String userBorn = request.getParameter("userBorn");
		String idCard = request.getParameter("idCard");
		String email = request.getParameter("email");
		String headImg = u.getMyInfo().getHeadImg();
		String userClass = request.getParameter("userClass");
		//封装成对象 后面补上
		User us = new User(userId, userName, userPhone, userPwd, userSex, userBorn, idCard, email, headImg, userClass);
		boolean ret = userService.update(us);
		LoginUser user = new LoginService().getUser(userPhone,userPwd);
		request.getSession().setAttribute("user", user);
		//调用查找单个用户的链接
		 request.getRequestDispatcher("/user/view/updateH.jsp").forward(request, response);
	}

	/** 查询（全部）用户*/
	private void userSelect(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		List<User> userSelect =new ArrayList();
		userSelect= userService.select();
		request.setAttribute("users", userSelect);
	    request.getRequestDispatcher("manager/view/user_list_all.jsp").forward(request, response);
	}
	
	/**
	 * 查找单个用户
	 */
	private void userSelectbyId(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
	}
	
	/**
	 * 搜索用户（根据电话号码）
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void userSelectbyph(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String phone = request.getParameter("key");
		List<User> ret = userService.userSelectbyph(phone);
		request.setAttribute("users", ret);
		request.getRequestDispatcher("manager/view/user_list_all.jsp").forward(request, response);
	}
	
	
	
	
}
