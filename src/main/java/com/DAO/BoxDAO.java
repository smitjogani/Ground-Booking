package com.DAO;

import java.util.List;

import com.entity.Boxes;

public interface BoxDAO {
	public List<Boxes> getAllBoxes();
	public boolean addBox(Boxes b);
	public List<Boxes> getBoxsById(int id);
	public boolean deleteBox(int id);
	public Boxes getBoxById(int id);
	public boolean editBox(Boxes b);
}
