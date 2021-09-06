package tanbao.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	
	 static{
			try {
				Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
		}
	 
	 /**
	  * 连接方法
	  */
		public static Connection getConnection() {
			Connection co = null;
			try {
				co = DriverManager.getConnection("jdbc:mysql://112.74.44.189:3306/tanbao", "root","!Zxc315126");
			}catch(SQLException e) {
				
				e.printStackTrace();
			}
			return co;
		}
		
		/**
		 * 关闭方法
		 */
		public static void closeConnection(Connection co) {
			try {
			if(co!= null) {
				co.close();
			}
			}catch(SQLException e ) {
				e.printStackTrace();
			}
		}
}
