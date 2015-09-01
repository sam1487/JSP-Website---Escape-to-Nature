package com.comp6000.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comp6000.project.entity.Admin;

public class AdminsDB extends BaseDB {
	public static Admin getAdminFromUname(String uname) {
		Admin admin = null;
		try {
			ResultSet result = makeQuery("SELECT * FROM Admins WHERE uname='" + uname + "'" );
			if(result == null) return null;		
			if(result.first()) {
				admin = getAdminFromResultSet(result);				
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
		return admin;
	}

	private static Admin getAdminFromResultSet(ResultSet result) throws SQLException {
		Admin admin = new Admin();
		admin.setId(result.getInt(1));
		admin.setUname(result.getString(2));
		admin.setPassword(result.getString(3));
		return admin;
	}
}
