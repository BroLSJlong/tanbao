package tanbao.entity.entitytable;

/**
 * 用户类
 * 对应用户表
 * @author 何崇宇
 *
 */
public class User {
	/**用户Id */
	private String userId;
	/**昵称 */
	private String userName;
	/**手机号 */
	private String phone;
	/**密码 */
	private String userPwd;
	/**性别 */
	private String userSex;
	/**出生日期 */
	private String userBorn;
	/**身份证 */
	private String idCard;
	/**邮箱 */
	private String email;
	/**头像 */
	private String headImg;
	/**用户类型 */
	private String userClass;
	
	public User() {};
	
	public User(String userId, String userName, String phone, String userPwd, String userSex, String userBorn,
			String idCard, String email, String headImg, String userClass) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.userPwd = userPwd;
		this.userSex = userSex;
		this.userBorn = userBorn;
		this.idCard = idCard;
		this.email = email;
		this.headImg = headImg;
		this.userClass = userClass;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getUserPwd() {
		return userPwd;
	}
	
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserSex() {
		return userSex;
	}
	
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	
	public String getUserBorn() {
		return userBorn;
	}
	
	public void setUserBorn(String userBorn) {
		this.userBorn = userBorn;
	}
	
	public String getIdCard() {
		return idCard;
	}
	
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getHeadImg() {
		return headImg;
	}
	
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	
	public String getUserClass() {
		return userClass;
	}
	
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	
}
