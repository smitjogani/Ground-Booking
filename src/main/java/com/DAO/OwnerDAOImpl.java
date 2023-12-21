package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Owner;

public class OwnerDAOImpl implements OwnerDAO {
	private Connection conn;

	public OwnerDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean ownerRegister(Owner ow) {
		boolean f = false;

		try {

			String sql = "insert into owner(ownerName,ownerEmail,ownerPassword,ownerPhone,ownerCity,ownerState,ownerGender,ownerPicture) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ow.getName());
			ps.setString(2, ow.getEmail());
			ps.setString(3, ow.getPassword());
			ps.setString(4, ow.getPhoneno());
			ps.setString(5, ow.getCity());
			ps.setString(6, ow.getState());
			ps.setString(7, ow.getGender());
			ps.setString(8, ow.getPicture());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public Owner login(String email, String password) {
		Owner ow = null;

		try {
			String sql = "select * from owner where ownerEmail=? and ownerPassword=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ow = new Owner();
				ow.setId(rs.getInt(1));
				ow.setName(rs.getString(2));
				ow.setEmail(rs.getString(3));
				ow.setPassword(rs.getString(4));
				ow.setPhoneno(rs.getString(5));
				ow.setCity(rs.getString(6));
				ow.setState(rs.getString(7));
				ow.setGender(rs.getString(8));
				ow.setPicture(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ow;
	}

	
	@Override
	public boolean editProfile(Owner o) {
		boolean f = false;
		
		
		try {
			
			String sql = "update owner set ownerName=?,ownerEmail=?,ownerPhone=?,ownerCity=?,ownerState=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, o.getName());
			ps.setString(2, o.getEmail());
			ps.setString(3, o.getPhoneno());
			ps.setString(4, o.getCity());
			ps.setString(5,  o.getState());
			ps.setInt(6, o.getId());
			
			int i = ps.executeUpdate();
			if(i == 1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean editPassword(String email, String password) {
		boolean f = false;
		
		try {
			
			String sql = "update owner set ownerPassword=? where ownerEmail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, password);
			ps.setString(2, email);
			
			int i = ps.executeUpdate();
			if(i == 1)
			{
				f = true;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
}
