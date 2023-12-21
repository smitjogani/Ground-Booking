package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Sloatb;
import com.entity.Sloatg;

public class SloatbDAOImpl implements SloatbDAO {
	private Connection conn;

	public SloatbDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addSloatB(Sloatb b) {
		boolean f = false;

		try {
			String sql = "insert into boxessloats(boxId,ownerId,date,timeFrom,timeTo) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, b.getSloatBoxId());
			ps.setInt(2, b.getSlotOwnerId());
			ps.setString(3, b.getDate());
			ps.setString(4, b.getTimeFrom());
			ps.setString(5, b.getTimeTo());

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
	public List<Sloatb> getSlotById(int id) {
		List<Sloatb> list = new ArrayList<Sloatb>();
		Sloatb b = null;

		try {

			String sql = "select * from boxessloats where boxId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new Sloatb();
				b.setSloatdId(id);
				b.setSloatBoxId(rs.getInt(2));
				b.setSlotOwnerId(rs.getInt(3));
				b.setDate(rs.getString(4));
				b.setTimeFrom(rs.getString(5));
				b.setTimeTo(rs.getString(6));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean bookBoxSlot(Sloatb b) {
		boolean f = false;

		try {

			String sql = "insert into sloatboxmapping(boxId,userId,ownerID,bookingDate,sloatTime) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, b.getSloatBoxId());
			ps.setInt(2, b.getUserId());
			ps.setInt(3, b.getSlotOwnerId());
			ps.setString(4, b.getDate());
			ps.setString(5, b.getSloatTIme());

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
	public List<Sloatb> getBoxSlotes(int id) {
		List<Sloatb> list = new ArrayList<Sloatb>();
		Sloatb sb = null;

		try {
			String sql = "select * from sloatboxmapping where ownerId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				sb = new Sloatb();
				sb.setSloatBoxId(rs.getInt(2));
				sb.setUserId(rs.getInt(3));
				sb.setSlotOwnerId(rs.getInt(4));
				sb.setDate(rs.getString(5));
				sb.setSloatTIme(rs.getString(6));
				list.add(sb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sloatb> getSlotsById(int id) {
	List<Sloatb> list = new ArrayList<Sloatb>();
	Sloatb sg = null;	
	try {
		String sql = "select * from boxessloats where groundId=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			sg = new Sloatb();
			sg.setSloatBoxId(rs.getInt(1));
			sg.setDate(rs.getString(3));
			sg.setTimeFrom(rs.getString(4));
			sg.setTimeTo(rs.getString(5));
			list.add(sg);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
	}

	@Override
	public boolean deleteSlot(int id) {
		boolean f = false;

		try {
			String sql = "delete from boxessloats where id=?";
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

}
