package tanbao.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tanbao.entity.LoginUser;
import tanbao.service.LoginService;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	/**
	 * 获取用户信息并跳转到index.jsp
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse respond) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		String pwd = request.getParameter("pwd");
		if(phone.equals("")) {
			request.setAttribute("LoginMessage", "用户名为空");
		}else if(pwd.equals("")) {
			request.setAttribute("LoginMessage", "密码为空");
		}else {
			LoginUser user = new LoginService().getUser(phone,pwd);
			request.getSession().setAttribute("user", user);
			if(user != null) {
				if (user.getMyInfo().getPhone().equals("supermanager")&&user.getMyInfo().getUserPwd().equals("supermanager")) {
					respond.sendRedirect("/tanbao/manager/view/manager.jsp");
					return;
				}else {
					respond.sendRedirect("/tanbao/index.jsp");
					return;
				}
			}
			else request.setAttribute("LoginMessage", "用户名或密码错误");
		}
		request.getRequestDispatcher("/login.jsp").forward(request, respond);
		
	}
}
