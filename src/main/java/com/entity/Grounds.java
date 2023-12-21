package com.entity;

public class Grounds {
	private int groundId;
	private int groundOwnerId;
	private String groundName;
	private String groundAdd;
	private String groundCity;
	private String groundState;
	private int groundPrice;
	private String groundPicture;

	public Grounds() {
		super();
	}

	public Grounds(int groundOwnerId, String groundName, String groundAdd, String groundCity, String groundState,
			int groundPrice, String groundPicture) {
		super();
		this.groundOwnerId = groundOwnerId;
		this.groundName = groundName;
		this.groundAdd = groundAdd;
		this.groundCity = groundCity;
		this.groundState = groundState;
		this.groundPrice = groundPrice;
		this.groundPicture = groundPicture;
	}

	public int getGroundId() {
		return groundId;
	}

	public void setGroundId(int groundId) {
		this.groundId = groundId;
	}

	public int getGroundOwnerId() {
		return groundOwnerId;
	}

	public void setGroundOwnerId(int groundOwnerId) {
		this.groundOwnerId = groundOwnerId;
	}

	public String getGroundName() {
		return groundName;
	}

	public void setGroundName(String groundName) {
		this.groundName = groundName;
	}

	public String getGroundAdd() {
		return groundAdd;
	}

	public void setGroundAdd(String groundAdd) {
		this.groundAdd = groundAdd;
	}

	public String getGroundCity() {
		return groundCity;
	}

	public void setGroundCity(String groundCity) {
		this.groundCity = groundCity;
	}

	public String getGroundState() {
		return groundState;
	}

	public void setGroundState(String groundState) {
		this.groundState = groundState;
	}

	public int getGroundPrice() {
		return groundPrice;
	}

	public void setGroundPrice(int groundPrice) {
		this.groundPrice = groundPrice;
	}

	public String getGroundPicture() {
		return groundPicture;
	}

	public void setGroundPicture(String groundPicture) {
		this.groundPicture = groundPicture;
	}

	@Override
	public String toString() {
		return "Grounds [groundId=" + groundId + ", groundOwnerId=" + groundOwnerId + ", groundName=" + groundName
				+ ", groundAdd=" + groundAdd + ", groundCity=" + groundCity + ", groundState=" + groundState
				+ ", groundPrice=" + groundPrice + ", groundPicture=" + groundPicture + "]";
	}

}
