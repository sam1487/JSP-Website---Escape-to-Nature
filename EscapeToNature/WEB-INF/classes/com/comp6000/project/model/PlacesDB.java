package com.comp6000.project.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.jdt.internal.compiler.ast.SuperReference;

import com.comp6000.project.entity.Place;


public class PlacesDB extends BaseDB{
	private static Place getPlaceFromResultSet(ResultSet set) throws Exception {
		Place place = new Place();
		place.setId(set.getInt("id"));
		place.setTitle(set.getString("title"));
		place.setState(set.getString("state"));
		place.setCity(set.getString("city"));
		place.setRating(set.getDouble("rating"));
		place.setRec_stay(set.getDouble("rec_stay"));
		place.setN_ratings(set.getInt("n_ratings"));;
		place.setN_recs(set.getInt("n_recs"));
		place.setDescription(set.getString("description"));
		return place;
	}
	public static void removePlace(int id) {
		String query = "DELETE FROM PlaceImages WHERE placeId=" + id;
		updateQuery(query);
		
		query = "DELETE FROM Places wHERE id=" + id;
		updateQuery(query);
		
	}
	public static Place getPlaceFromId(int id) {
		
		Place place = null;	
		try {
			ResultSet result = makeQuery("SELECT * FROM Places WHERE id=" + id );
			if(result == null) return null;
			
			if(result.first()) {
				place = getPlaceFromResultSet(result);
				
				// get image links
				ResultSet imageRS = makeQuery("SELECT * FROM PlaceImages WHERE placeId=" + id);
				if(imageRS != null) {
					String[] imageLinks = getImageLinks(imageRS);
					place.setImageLinks(imageLinks);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return place;
	}

	private static String[] getImageLinks(ResultSet imageRS) throws Exception {
		ArrayList<String> links = new ArrayList<String>();
		while(imageRS.next()) {
			links.add(imageRS.getString("imageLink"));
		}
		return links.toArray(new String[]{});
	}
	
	public static int insertNewPlace(Place place) {
		int placeId = -1;
		
		String query = "INSERT INTO `Places` (`title`, `state`, `city`, `rating`, `rec_stay`, `n_ratings`, `n_recs`, `description`) VALUES " +
				"(?,?,?,?,?,?,?,?)";
		
		
		Connection con = getConnection();		
		try {
			PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, place.getTitle());
			stmt.setString(2, place.getState());
			stmt.setString(3, place.getCity());
			stmt.setDouble(4, place.getRating());
			stmt.setDouble(5, place.getRec_stay());
			stmt.setInt(6, place.getN_ratings());
			stmt.setInt(7, place.getN_recs());
			stmt.setString(8, place.getDescription());
			
			
			System.out.println(stmt.toString());
			stmt.executeUpdate();
			
			ResultSet rs = stmt.getGeneratedKeys();
		   
		    System.out.println("QUERY: " + query);
		    
		    if(rs.next()) {
		    	placeId = rs.getInt(1);
		    	for(String link : place.getImageLinks()) {
					query = String.format("INSERT INTO PlaceImages (placeId, imageLink) VALUES (%d, '%s')", placeId, link);
					insertQuery(query);
				}
		    }		    
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		
		return placeId;
	}

	public static void updateNewPlace(Place place) {
		String query = "Update Places SET title=?, state=?, city=?, rating=?, rec_stay=?, n_ratings=?, n_recs=?, description=? WHERE id=?";
		

		Connection con = getConnection();		
		try {
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, place.getTitle());
			stmt.setString(2, place.getState());
			stmt.setString(3, place.getCity());
			stmt.setDouble(4, place.getRating());
			stmt.setDouble(5, place.getRec_stay());
			stmt.setInt(6, place.getN_ratings());
			stmt.setInt(7, place.getN_recs());
			stmt.setString(8, place.getDescription());
			stmt.setInt(9, place.getId());
			
			System.out.println(stmt.toString());
			stmt.executeUpdate();			
				
			query = "DELETE FROM PlaceImages WHERE placeId=" + place.getId();
			updateQuery(query);
			
			for(String link : place.getImageLinks()) {
				query = String.format("INSERT INTO PlaceImages (placeId, imageLink) VALUES (%d, '%s')", place.getId(), link);
				insertQuery(query);
			}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Place[] getAllPlacesForStateCity(String state, String city) {
		ArrayList<Place> toret = new ArrayList<Place>();
		String query = String.format("SELECT id FROM Places WHERE state='%s' and city='%s'", state, city);
		ResultSet rs = makeQuery(query);
		try {
			while(rs.next()) {
				int id = rs.getInt(1);
				toret.add(getPlaceFromId(id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toret.toArray(new Place[]{});
	}
	
	public static Place[] getAllPlacesForState(String state) {
		ArrayList<Place> toret = new ArrayList<Place>();
		String query = String.format("SELECT id FROM Places WHERE state='%s'", state);
		ResultSet rs = makeQuery(query);
		try {
			while(rs.next()) {
				int id = rs.getInt(1);
				toret.add(getPlaceFromId(id));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toret.toArray(new Place[]{});
	}
	
	public static Place[] getAllPlaces() {
		ArrayList<Place> toret = new ArrayList<Place>();
		String query = String.format("SELECT id FROM Places");
		ResultSet rs = makeQuery(query);
		try {
			while(rs.next()) {
				int id = rs.getInt(1);
				toret.add(getPlaceFromId(id));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toret.toArray(new Place[]{});
	}
	
}
