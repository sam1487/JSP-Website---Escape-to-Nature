package com.comp6000.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.comp6000.project.entity.Hotel;

public class HotelsDB extends BaseDB{
	public static Hotel getHotelForId(int id) {
		Hotel toret = new Hotel();
		try {
			ResultSet result = makeQuery("SELECT * FROM Hotels WHERE id=" + id );
			if(result == null) return null;
			
			if(result.first()) {
				toret = getHotelFromResultSet(result);				
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return toret;
	}

	private static Hotel getHotelFromResultSet(ResultSet set) throws SQLException {
		Hotel hotel = new Hotel();
		hotel.setId(set.getInt("id"));
		hotel.setTitle(set.getString("title"));
		hotel.setState(set.getString("state"));
		hotel.setCity(set.getString("city"));
		hotel.setStreetAddr(set.getString("street_addr"));
		hotel.setPhone(set.getString("phone"));
		hotel.setEmail(set.getString("email"));
		hotel.setWeb(set.getString("web"));;
		hotel.setImageLink(set.getString("image_link"));
		
		return hotel;
	}
	
	public static Hotel[] getHotelsAt(String state, String city) {
		ArrayList<Hotel> toret = new ArrayList<Hotel>();
		String query = String.format("SELECT id FROM Hotels WHERE state='%s' and city='%s'", state, city);
		ResultSet rs = makeQuery(query);
		try {
			while(rs.next()) {
				int id = rs.getInt(1);
				toret.add(getHotelForId(id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toret.toArray(new Hotel[]{});
	}
	
	public static Hotel[] getHotelsAtState(String state) {
		ArrayList<Hotel> toret = new ArrayList<Hotel>();
		String query = String.format("SELECT id FROM Hotels WHERE state='%s'", state);
		ResultSet rs = makeQuery(query);
		try {
			while(rs.next()) {
				int id = rs.getInt(1);
				toret.add(getHotelForId(id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toret.toArray(new Hotel[]{});
	}
	
	public static Hotel[] getAllHotels() {
		ArrayList<Hotel> toret = new ArrayList<Hotel>();
		String query = String.format("SELECT id FROM Hotels");
		ResultSet rs = makeQuery(query);
		try {
			while(rs.next()) {
				int id = rs.getInt(1);
				toret.add(getHotelForId(id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toret.toArray(new Hotel[]{});
	}

	public static int insertNewHotel(Hotel hotel) {
		int hotelId = -1;
		
		String query = "INSERT INTO `Hotels` (`title`, `state`, `city`, `street_addr`, `phone`, `email`, `web`, `image_link`) VALUES " +
				"(?,?,?,?,?,?,?,?)";
		
		Connection con = getConnection();		
		try {
			PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, hotel.getTitle());
			stmt.setString(2, hotel.getState());
			stmt.setString(3, hotel.getCity());			
			stmt.setString(4, hotel.getStreetAddr());
			stmt.setString(5, hotel.getPhone());
			stmt.setString(6, hotel.getEmail());
			stmt.setString(7, hotel.getWeb());
			stmt.setString(8, hotel.getImageLink());
					
			System.out.println(stmt.toString());
			stmt.executeUpdate();
			
			ResultSet rs = stmt.getGeneratedKeys();
			if(rs.next()) {
		    	hotelId = rs.getInt(1);		    	
		    }
		   
		    System.out.println("QUERY: " + query);
		    	    
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		
		return hotelId;
	}
	
	public static int updateHotel(Hotel hotel) {
		int hotelId = -1;
		
		String query = "UPDATE  `Hotels` SET `title`=?, `state`=?, `city`=?, `street_addr`=?, `phone`=?, `email`=?, `web`=?, `image_link`=? WHERE id=?";
		
		Connection con = getConnection();		
		try {
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, hotel.getTitle());
			stmt.setString(2, hotel.getState());
			stmt.setString(3, hotel.getCity());			
			stmt.setString(4, hotel.getStreetAddr());
			stmt.setString(5, hotel.getPhone());
			stmt.setString(6, hotel.getEmail());
			stmt.setString(7, hotel.getWeb());
			stmt.setString(8, hotel.getImageLink());
			stmt.setInt(9, hotel.getId());
			
			System.out.println(stmt.toString());
			stmt.executeUpdate();
				    	    
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		
		return hotelId;
	}
	
	public static void removeHotel(int id) {		
		String query = "DELETE FROM Hotels wHERE id=" + id;
		updateQuery(query);	
	}
}
