package com.DAO;

import com.entity.Owner;

public interface OwnerDAO {
	public boolean ownerRegister(Owner ow);
	public Owner login(String email, String password);
	public boolean editProfile(Owner o);
	public boolean editPassword(String email, String password);
}
