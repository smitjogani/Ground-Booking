package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Sloatb;
import com.entity.Sloatg;

public class SloatgDAOImpl implements SloatgDAO {
	private Connection conn;

	public SloatgDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addSloat(Sloatg s) {
		boolean f = false;

		try {
			String sql = "insert into groundsloats(groundId,ownerId,date,timeFrom,timeTo) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, s.getSloatGroundId());
			ps.setInt(2, s.getSlotOwnerId());
			ps.setString(3, s.getDate());
			ps.setString(4, s.getTimeFrom());
			ps.setString(5, s.getTimeTo());

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
	public List<Sloatg> getSlotById(int id) {
		List<Sloatg> list = new ArrayList<Sloatg>();
		Sloatg g = null;

		try {
			String sql = "select * from groundsloats where groundId=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				g = new Sloatg();
				g.setSloatgId(rs.getInt(1));
				g.setSloatGroundId(rs.getInt(2));
				g.setSlotOwnerId(rs.getInt(3));
				g.setDate(rs.getString(4));
				g.setTimeFrom(rs.getString(5));
				g.setTimeTo(rs.getString(6));
				list.add(g);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean bookGroundSlot(Sloatg g) {
		boolean f = false;

		try {

			String sql = "insert into sloatgroundmapping(groundId,userId,ownerID,bookingDate,sloatTime) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, g.getSloatGroundId());
			ps.setInt(2, g.getUserId());
			ps.setInt(3, g.getSlotOwnerId());
			ps.setString(4, g.getDate());
			ps.setString(5, g.getSloatTime());

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
	public List<Sloatg> getSlots(int id) {
		List<Sloatg> list = new ArrayList<Sloatg>();
		Sloatg sg = null;

		try {

			String sql = "select * from sloatgroundmapping where ownerId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {				
				sg = new Sloatg();
				sg.setSloatGroundId(rs.getInt(2));
				sg.setUserId(rs.getInt(3));
				sg.setSlotOwnerId(rs.getInt(4));
				sg.setDate(rs.getString(5));
				sg.setSloatTime(rs.getString(6));
//				sg.setUserName(rs.getString(7));
//				sg.setDate(rs.getString(4));
//				sg.setSloatTime(rs.getString(5));
//				sg.setUserContactNo(rs.getString(10));
				list.add(sg);
			}				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Sloatg> getSlotsById(int id) {
		List<Sloatg> list = new ArrayList<Sloatg>();
		Sloatg sg = null;
		//System.out.println(id);
		try {

			String sql = "select * from groundsloats where groundId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sg = new Sloatg();
				sg.setSloatgId(rs.getInt(2));
				sg.setDate(rs.getString(4));
				sg.setTimeFrom(rs.getString(5));
				sg.setTimeTo(rs.getString(6));
				list.add(sg);
				//System.out.println(sg);
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

			String sql = "delete from groundsloats where id=?";
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
