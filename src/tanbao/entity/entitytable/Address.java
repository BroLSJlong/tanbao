package tanbao.entity.entitytable;

/**
 * 地址
 * 对应地址表
 * @author 何崇宇
 *
 */
public class Address {
	/**用户Id */
	private String userId;
	/**地址Id */
	private String addressId;
	/**地址内容 */
	private String address;
	/**收货人 */
	private String name;
	/**手机号 */
	private String phone;
	
	public Address() {}
	
	public Address(String userId, String addressId, String address, String name, String phone) {
		super();
		this.userId = userId;
		this.addressId = addressId;
		this.address = address;
		this.name = name;
		this.phone = phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	
}
