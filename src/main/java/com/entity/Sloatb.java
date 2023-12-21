package com.entity;

public class Sloatb {
	private int sloatBoxId;
	private int sloatdId;
	private String date;
	private String timeFrom;
	private String timeTo;
	private int userId;
	private String sloatTIme;
	private int slotOwnerId;
	
	public Sloatb() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getSlotOwnerId() {
		return slotOwnerId;
	}

	public void setSlotOwnerId(int slotOwnerId) {
		this.slotOwnerId = slotOwnerId;
	}

	public int getSloatBoxId() {
		return sloatBoxId;
	}

	public void setSloatBoxId(int sloatBoxId) {
		this.sloatBoxId = sloatBoxId;
	}

	public int getSloatdId() {
		return sloatdId;
	}

	public void setSloatdId(int sloatdId) {
		this.sloatdId = sloatdId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(String timeFrom) {
		this.timeFrom = timeFrom;
	}

	public String getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(String timeTo) {
		this.timeTo = timeTo;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getSloatTIme() {
		return sloatTIme;
	}

	public void setSloatTIme(String sloatTIme) {
		this.sloatTIme = sloatTIme;
	}

	@Override
	public String toString() {
		return "Sloatb [sloatBoxId=" + sloatBoxId + ", sloatdId=" + sloatdId + ", date=" + date + ", timeFrom="
				+ timeFrom + ", timeTo=" + timeTo + ", userId=" + userId + ", sloatTIme=" + sloatTIme + ", slotOwnerId="
				+ slotOwnerId + "]";
	}
}
