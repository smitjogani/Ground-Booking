package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Umpire;

public class UmpireDAOImpl implements UmpireDAO {
	private Connection conn;

	public UmpireDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean umpireRegister(Umpire ur) {
		boolean f = false;

		try {
			String sql = "insert into umpire(umpireName,umpireEmail,umpirePassword,umpirePhone,umpireCity,umpireState,umpireCharge,umpireGender,umpirePicture) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ur.getName());
			ps.setString(2, ur.getEmail());
			ps.setString(3, ur.getPassword());
			ps.setString(4, ur.getPhoneno());
			ps.setString(5, ur.getCity());
			ps.setString(6, ur.getState());
			ps.setString(7, ur.getCharge());
			ps.setString(8, ur.getGender());
			ps.setString(9, ur.getPicture());

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
	public List<Umpire> getAllUmpire() {
		List<Umpire> ulist = new ArrayList<Umpire>();
		Umpire u = null;

		try {
			String sql = "Select * from umpire";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new Umpire();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPhoneno(rs.getString(5));
				u.setCity(rs.getString(6));
				u.setState(rs.getString(7));
				u.setCharge(rs.getString(8));
				u.setPicture(rs.getString(10));

//				System.out.println(u);

				ulist.add(u);
			}

		} catch (Exception e) {

		}

		return ulist;
	}

	@Override
	public Umpire login(String email, String password) {
		Umpire ur = null;

		try {
			String sql = "select * from umpire where umpireEmail=? and umpirePassword=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ur = new Umpire();
				ur.setId(rs.getInt(1));
				ur.setName(rs.getString(2));
				ur.setEmail(rs.getString(3));
				ur.setPassword(rs.getString(4));
				ur.setPhoneno(rs.getString(5));
				ur.setCity(rs.getString(6));
				ur.setState(rs.getString(7));
				ur.setCharge(rs.getString(8));
				ur.setGender(rs.getString(9));
				ur.setPicture(rs.getString(10));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ur;
	}

	@Override
	public boolean editPassword(String email, String password) {
		boolean f = false;

		try {

			String sql = "update umpire set umpirePassword=? where umpireEmail=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, password);
			ps.setString(2, email);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
