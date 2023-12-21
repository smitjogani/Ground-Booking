package com.DAO;

import java.util.List;

import com.entity.Umpire;

public interface UmpireDAO {
	public boolean umpireRegister(Umpire ur);
	public Umpire login(String email,String password);
	public List<Umpire> getAllUmpire();
	public boolean editPassword(String email,String password);
}
