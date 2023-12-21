package com.entity;

public class Boxes {
	private int boxOwnerId;
	private int boxId;
	private String boxName;
	private String boxAdd;
	private String boxCity;
	private String boxState;
	private int boxPrice;
	private String boxPicture;

	public Boxes() {
		super();
	}

	public Boxes(int boxOwnerId, String boxName, String boxAdd, String boxCity, String boxState, int boxPrice,
			String boxPicture) {
		super();
		this.boxOwnerId = boxOwnerId;
		this.boxName = boxName;
		this.boxAdd = boxAdd;
		this.boxCity = boxCity;
		this.boxState = boxState;
		this.boxPrice = boxPrice;
		this.boxPicture = boxPicture;
	}

	public int getBoxOwnerId() {
		return boxOwnerId;
	}

	public void setBoxOwnerId(int boxOwnerId) {
		this.boxOwnerId = boxOwnerId;
	}

	public int getBoxId() {
		return boxId;
	}

	public void setBoxId(int boxId) {
		this.boxId = boxId;
	}

	public String getBoxName() {
		return boxName;
	}

	public void setBoxName(String boxName) {
		this.boxName = boxName;
	}

	public String getBoxAdd() {
		return boxAdd;
	}

	public void setBoxAdd(String boxAdd) {
		this.boxAdd = boxAdd;
	}

	public String getBoxCity() {
		return boxCity;
	}

	public void setBoxCity(String boxCity) {
		this.boxCity = boxCity;
	}

	public String getBoxState() {
		return boxState;
	}

	public void setBoxState(String boxState) {
		this.boxState = boxState;
	}

	public int getBoxPrice() {
		return boxPrice;
	}

	public void setBoxPrice(int boxPrice) {
		this.boxPrice = boxPrice;
	}

	public String getBoxPicture() {
		return boxPicture;
	}

	public void setBoxPicture(String boxPicture) {
		this.boxPicture = boxPicture;
	}

	@Override
	public String toString() {
		return "Boxes [boxOwnerId=" + boxOwnerId + ", boxId=" + boxId + ", boxName=" + boxName + ", boxAdd=" + boxAdd
				+ ", boxCity=" + boxCity + ", boxState=" + boxState + ", boxPrice=" + boxPrice + ", boxPicture="
				+ boxPicture + "]";
	}

}
