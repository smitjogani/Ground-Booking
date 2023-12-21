package com.DAO;

import java.util.List;

import com.entity.Grounds;

public interface GroundDAO {
	public List<Grounds> getAllGrounds();
	public boolean addGround(Grounds g);
	public List<Grounds> getGroundsById(int id);
	public boolean deleteGround(int id);
	public Grounds getGroundbyId(int id);
	public boolean editGround(Grounds g);
}
