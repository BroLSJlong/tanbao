package tanbao.common;

/**
 * 关于“用户类型”和“订单状态”的类型转换
 * 前端传来数字类型的参数，经此工具转换成供后端操作的对应字符串
 */
public class TypeConversion {
	/**
	 * 用户性别转换（0-女，1-男）
	 */
	public static String userSexConversion(String c) {
		String info = null;
		switch(c) {
		case "0":
			info = "女";
			return info;
		case "1":
			info = "男";
			return info;
		default:
			info ="未知";
		}
		return info;
	}
	
	/**
	 * 用户类型转换（数字类型转为字符串）
	 */
	public static String userTypeConversion(String a) {
		String info = null;
		switch(a) {
		case "1":
			info = "普通用户";
			return info;
		case "2":
			info = "用户管理员";
			return info;
		case "3":
			info = "商品管理员";
			return info;
		case "4":
			info = "官方客服";
			return info;
		default:
			info ="其他";
		}
		return info;
	}
	
	/**
	 * 订单状态转换（数字类型转为字符串）
	 */
	public static String orderTypeConversion(String b) {
		String info = null;
		switch(b) {
		case "1":
			info = "未付款";
			return info;
		case "2":
			info = "已付款";
			return info;
		case "3":
			info = "已发货";
			return info;
		case "4":
			info = "待收货";
			return info;
		case "5":
			info = "已签收";
			return info;
		case "6":
			info = "待评价";
			return info;
		case "7":
			info = "订单已取消";
			return info;
		case "8":
			info = "交易完成";
			return info;
		default:
			info ="其他";
		}
		return info;
	}
	
	public static String orderTypeConversionToNum(String b) {
		String info = null;
		switch(b) {
		case "未付款":
			info = "1";
			return info;
		case "已付款":
			info = "2";
			return info;
		case "已发货":
			info = "3";
			return info;
		case "待收货":
			info = "4";
			return info;
		case "已签收":
			info = "5";
			return info;
		case "待评价":
			info = "6";
			return info;
		case "订单已取消":
			info = "7";
			return info;
		case "交易完成":
			info = "8";
			return info;
		default:
			info ="0";
		}
		return info;
	}
}
