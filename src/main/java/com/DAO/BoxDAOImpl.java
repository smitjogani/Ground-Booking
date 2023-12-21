package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Boxes;

public class BoxDAOImpl implements BoxDAO {
	private Connection conn;

	public BoxDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Boxes> getAllBoxes() {
		List<Boxes> blist = new ArrayList<Boxes>();
		Boxes b = null;

		try {
			String sql = "select * from box";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Boxes();
				b.setBoxId(rs.getInt(1));
				b.setBoxName(rs.getString(3));
				b.setBoxAdd(rs.getString(4));
				b.setBoxCity(rs.getString(5));
				b.setBoxState(rs.getString(6));
				b.setBoxPrice(rs.getInt(7));
				b.setBoxPicture(rs.getString(8));

//				System.out.print(b);

				blist.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return blist;
	}

	@Override
	public boolean addBox(Boxes b) {
		boolean f = false;

		try {

			String sql = "insert into box(ownerId,boxName,boxAdd,boxCity,boxState,boxPrice,boxPicture) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, b.getBoxOwnerId());
			ps.setString(2, b.getBoxName());
			ps.setString(3, b.getBoxAdd());
			ps.setString(4, b.getBoxCity());
			ps.setString(5, b.getBoxState());
			ps.setInt(6, b.getBoxPrice());
			ps.setString(7, b.getBoxPicture());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}

	@Override
	public List<Boxes> getBoxsById(int id) {
		List<Boxes> list = new ArrayList<Boxes>();
		Boxes b = null;

		try {

			String sql = "select * from box where ownerId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Boxes();
				b.setBoxId(rs.getInt(1));
				b.setBoxName(rs.getString(3));
				b.setBoxAdd(rs.getString(4));
				b.setBoxCity(rs.getString(5));
				b.setBoxState(rs.getString(6));
				b.setBoxPrice(rs.getInt(7));
				b.setBoxPicture(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean deleteBox(int id) {
		boolean f = false;

		try {

			String sql = "delete from box where id=?";
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
	public Boxes getBoxById(int id) {
		Boxes b = null;

		try {

			String sql = "select * from box where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Boxes();
				b.setBoxId(rs.getInt(1));
				b.setBoxName(rs.getString(3));
				b.setBoxAdd(rs.getString(4));
				b.setBoxCity(rs.getString(5));
				b.setBoxState(rs.getString(6));
				b.setBoxPrice(rs.getInt(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean editBox(Boxes b) {
		boolean f = false;

		try {

			String sql = "update box set boxName=?,boxAdd=?,boxCity=?,boxState=?,boxPrice=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, b.getBoxName());
			ps.setString(2, b.getBoxAdd());
			ps.setString(3, b.getBoxCity());
			ps.setString(4, b.getBoxState());
			ps.setInt(5, b.getBoxPrice());
			ps.setInt(6, b.getBoxId());

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
