package com.DAO;

import java.util.List;

import com.entity.Sloatb;
import com.entity.Sloatg;

public interface SloatbDAO {
	public boolean addSloatB(Sloatb b);
	public List<Sloatb> getSlotById(int id);
	public boolean bookBoxSlot(Sloatb b); 
	public List<Sloatb> getBoxSlotes(int id);
	public List<Sloatb> getSlotsById(int id);
	public boolean deleteSlot(int id);
}
