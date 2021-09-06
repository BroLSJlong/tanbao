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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import tanbao.entity.entitytable.GoodsImg;
import tanbao.service.GoodsService;
import tanbao.util.UUIDUtil;

/**
 * 商品图片上传：
 * 已导入jar包
 * ！还需配置阿里云服务器Tomcat中server.xml中的文件（商品图片）访问路径
 */
@WebServlet("/GoodsImgUploadServlet")
public class GoodsImgUploadServlet extends HttpServlet{
	private GoodsService goodsService = new GoodsService();
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//先判断请求内容是否为multipart/form-data 类型
		if(ServletFileUpload.isMultipartContent(request)) {
			DiskFileItemFactory fif = new DiskFileItemFactory();
			
			//设置商品图片缓冲区大小为10M
			fif.setSizeThreshold(1024*1024*10);
			
			//当上传的商品图片超过缓冲区大小时，启用临时文件夹进行缓存（暂存）
			//注意需配置好GoodsImg文件夹
			fif.setRepository(new File("C:/upload/GoodsImg/temp"));	
			ServletFileUpload upload = new ServletFileUpload(fif);
			//设置上传的单个头像的最大值是20M
			upload.setSizeMax(1024*1024*20);
			try {
				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> it = items.iterator();
				while(it.hasNext()) {
					FileItem item = it.next();
					//判断上传的是否为图片（非空为图片），暂未编写动图上传功能
					if(ImageIO.read(item.getInputStream()) != null) {
						String fileName = item.getName();
						if(null != fileName && !fileName.equals("")) {
							//给该商品图片设置唯一的id
						   	fileName = UUIDUtil.getUUID() + fileName.substring(fileName.lastIndexOf("."));
							// 设置商品图片上传路径
							File file = new File("C:/upload/GoodsImg", fileName);
							// 上传商品图片到 c:/upload/GoodsImg
							item.write(file);
							
							//获取页面传来的商品id,将商品图片（名字）保存到数据库
							String goodid = request.getParameter("currentid");
							GoodsImg goodsImg = new GoodsImg(goodid, fileName);
							boolean ret = goodsService.addImg(goodsImg);
							if(ret == true) {
								System.out.println("成功");
							}else {
								System.out.println("失败");
							}
							}
						}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("请求内容出错");
		}
		//转回原商品图片上传页面
		response.sendRedirect("/tanbao/manager/view/productimg_gl.jsp");
		
	}
}
