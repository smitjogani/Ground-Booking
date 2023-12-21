	package com.entity;

public class Sloatg {
	private int sloatGroundId;
	private int sloatgId; 
	private String date;
	private String timeFrom;
	private String timeTo;
	private int userId;
	private String sloatTime;
	
	private String userName;
	private String groundName;
	private String userContactNo;
	private int slotOwnerId;
	
	public Sloatg() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getSlotOwnerId() {
		return slotOwnerId;
	}

	public void setSlotOwnerId(int slotOwnerId) {
		this.slotOwnerId = slotOwnerId;
	}

	public int getSloatGroundId() {
		return sloatGroundId;
	}
	public void setSloatGroundId(int sloatGroundId) {
		this.sloatGroundId = sloatGroundId;
	}
	

	public String getGroundName() {
		return groundName;
	}

	public void setGroundName(String groundName) {
		this.groundName = groundName;
	}

	public int getSloatgId() {
		return sloatgId;
	}

	public void setSloatgId(int sloatgId) {
		this.sloatgId = sloatgId;
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

	public String getSloatTime() {
		return sloatTime;
	}

	public void setSloatTime(String sloatTime) {
		this.sloatTime = sloatTime;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserContactNo() {
		return userContactNo;
	}

	public void setUserContactNo(String userContactNo) {
		this.userContactNo = userContactNo;
	}

	@Override
	public String toString() {
		return "Sloatg [sloatGroundId=" + sloatGroundId + ", sloatgId=" + sloatgId + ", date=" + date + ", timeFrom="
				+ timeFrom + ", timeTo=" + timeTo + ", userId=" + userId + ", sloatTime=" + sloatTime + ", userName="
				+ userName + ", groundName=" + groundName + ", userContactNo=" + userContactNo + ", slotOwnerId="
				+ slotOwnerId + "]";
	}
	
	
}
