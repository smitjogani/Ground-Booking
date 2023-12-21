package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Grounds;

public class GroundDAOImpl implements GroundDAO {

	private Connection conn;

	public GroundDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Grounds> getAllGrounds() {

		List<Grounds> list = new ArrayList<Grounds>();
		Grounds g = null;

		try {
			String sql = "select * from ground";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				g = new Grounds();
				g.setGroundId(rs.getInt(1));
				g.setGroundName(rs.getString(3));
				g.setGroundAdd(rs.getString(4));
				g.setGroundCity(rs.getString(5));
				g.setGroundState(rs.getString(6));
				g.setGroundPrice(rs.getInt(7));
				g.setGroundPicture(rs.getString(8));
//				System.out.print(g);
				list.add(g);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean addGround(Grounds g) {
		boolean f = false;

		try {
			String sql = "insert into ground(ownerId,groundName,groundAdd,groundCity,groundState,groundPrice,groundPicture) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, g.getGroundOwnerId());
			ps.setString(2, g.getGroundName());
			ps.setString(3, g.getGroundAdd());
			ps.setString(4, g.getGroundCity());
			ps.setString(5, g.getGroundState());
			ps.setInt(6, g.getGroundPrice());
			ps.setString(7, g.getGroundPicture());

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
	public List<Grounds> getGroundsById(int id) {
		List<Grounds> list = new ArrayList<Grounds>();
		Grounds g = null;

		try {
			String sql = "select * from ground where ownerId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				g = new Grounds();
				g.setGroundId(rs.getInt(1));
				g.setGroundName(rs.getString(3));
				g.setGroundAdd(rs.getString(4));
				g.setGroundCity(rs.getString(5));
				g.setGroundState(rs.getString(6));
				g.setGroundPrice(rs.getInt(7));
				g.setGroundPicture(rs.getString(8));
//				System.out.print(g);
				list.add(g);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteGround(int id) {
		boolean f = false;

		try {

			String sql = "delete from ground where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
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
	public Grounds getGroundbyId(int id) {
		Grounds g = null;

		try {

			String sql = "select * from ground where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				g = new Grounds();
				g.setGroundId(rs.getInt(1));
				g.setGroundName(rs.getString(3));
				g.setGroundAdd(rs.getString(4));
				g.setGroundCity(rs.getString(5));
				g.setGroundState(rs.getString(6));
				g.setGroundPrice(rs.getInt(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return g;
	}

	@Override
	public boolean editGround(Grounds g) {
		boolean f = false;

		try {
			String sql = "update ground set groundName=?,groundAdd=?,groundCity=?,groundState=?,groundPrice=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1,g.getGroundName());
			ps.setString(2, g.getGroundAdd());
			ps.setString(3, g.getGroundCity());
			ps.setString(4, g.getGroundState());
			ps.setInt(5, g.getGroundPrice());
			ps.setInt(6, g.getGroundId());
			
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

}
