package tanbao.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import tanbao.entity.LoginUser;
import tanbao.entity.entitytable.User;
import tanbao.service.UserService;
import tanbao.util.UUIDUtil;

/**
 * 用户头像上传：
 * 已导入jar包
 * ！还需配置阿里云服务器Tomcat中server.xml中的文件（用户头像）访问路径
 */
@WebServlet("/UserHeadImgUploadServlet")
public class UserHeadImgUploadServlet extends HttpServlet{
	private UserService userService = new UserService();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//先判断请求内容是否为multipart/form-data 类型
		if(ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory fif = new DiskFileItemFactory();
			
			//设置头像缓冲区大小为2M
			fif.setSizeThreshold(1024*1024*2);
			
			//当上传头像超过缓冲区大小时，启用临时文件夹进行缓存（暂存）
			//注意需配置好UserHeadImg文件夹
			fif.setRepository(new File("C:/upload/UserImg/temp"));	
			ServletFileUpload upload = new ServletFileUpload(fif);
			
			//设置上传的单个头像的最大值是4M
			upload.setSizeMax(1024*1024*4);	
			try {
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> it = items.iterator();
				while(it.hasNext()) {
					FileItem item = it.next();
					//判断上传头像是否为图片（非空为图片）
					if(ImageIO.read(item.getInputStream()) != null) {
						String fileName = item.getName();
						if(null != fileName && !fileName.equals("")) {
							//给该头像设置唯一的id
						   	fileName = UUIDUtil.getUUID() + fileName.substring(fileName.lastIndexOf("."));
							// 设置头像上传路径
							// 上传头像到 c:/upload/UserHeadImg
							item.write(new File("C:/upload/UserImg", fileName));
							
							//将头像（名字）保存到数据库
							HttpSession session = request.getSession();
							LoginUser user = (LoginUser)session.getAttribute("user");
							user.getMyInfo().setHeadImg(fileName);
							boolean ret = userService.updateUserHeadImgService(user.getMyInfo());
						}
					}else {
						System.out.println("非图片");
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("请求内容出错");
		}
		//转回原头像上传页面
		response.sendRedirect("/tanbao/user/view/update.jsp");
	}

}
