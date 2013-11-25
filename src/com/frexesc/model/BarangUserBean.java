package com.frexesc.model;

import java.util.Date;

public class BarangUserBean {
	private long id;
	private long id_item;
	private long id_user;
	private String status;
	private int total_item;
	private Date buyDate;
	private String description;

	public BarangUserBean(long id, long id_item, long id_user, String status,
			int total_item, Date buyDate, String description) {
		super();
		this.id = id;
		this.id_item = id_item;
		this.id_user = id_user;
		this.status = status;
		this.total_item = total_item;
		this.buyDate = buyDate;
		this.description = description;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId_item() {
		return id_item;
	}

	public void setId_item(long id_item) {
		this.id_item = id_item;
	}

	public long getId_user() {
		return id_user;
	}

	public void setId_user(long id_user) {
		this.id_user = id_user;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotal_item() {
		return total_item;
	}

	public void setTotal_item(int total_item) {
		this.total_item = total_item;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
