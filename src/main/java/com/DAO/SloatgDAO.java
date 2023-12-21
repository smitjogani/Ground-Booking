package com.DAO;

import java.util.List;

import com.entity.Sloatg;

public interface SloatgDAO {
	public boolean addSloat(Sloatg s);
	public List<Sloatg> getSlotById(int id);
	public boolean bookGroundSlot(Sloatg g); 
	public List<Sloatg> getSlots(int id);
	public List<Sloatg> getSlotsById(int id);
	public boolean deleteSlot(int id);
}
