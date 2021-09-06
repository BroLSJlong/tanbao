package tanbao.util;

import java.util.UUID;

/**
 * 生成32位UID
 * @author ljy
 *
 */

public class UUIDUtil {
	public static String getUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/*public static void main(String[] args) {
		System.out.println(getUUID());
	}*/
}
