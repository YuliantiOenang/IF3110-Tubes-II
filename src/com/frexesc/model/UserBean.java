package com.frexesc.model;

public class UserBean {
	private String username;
	private String password;
	private String email;
	private String name;
	private String telephone;
	private String address;
	private String province;
	private String city;
	private String postal;

	public UserBean(String username, String password, String email,
			String name, String telephone, String address, String province,
			String city, String postal) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.name = name;
		this.telephone = telephone;
		this.address = address;
		this.province = province;
		this.city = city;
		this.postal = postal;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostal() {
		return postal;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}
}
