<%@page import="com.comp6000.project.util.Util"%>
<%@page import="com.comp6000.project.model.HotelsDB"%>
<%@page import="com.comp6000.project.entity.Hotel"%>
<%@page import="com.comp6000.project.entity.Place"%>
<%@page import="com.comp6000.project.model.PlacesDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Boolean loggedIn = (Boolean) session.getAttribute("adminLoggedIn");
	if(loggedIn == null || !loggedIn) 
		response.sendRedirect("adminlogin.jsp");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Hotel</title>
</head>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Hotel hotel = null;
	try {
		hotel = HotelsDB.getHotelForId(id);
		HotelsDB.removeHotel(id); 		
		response.sendRedirect("hotels.jsp");
%>

<body>
	<%@include file="header.jsp" %>		
	<div id="content-area">
	<% 
		out.write("<br>The hotel <b>" + hotel.getTitle() + "</b>" + " has been successfully removed from the database.<br><br>");
		out.write("<br><br><a class=\"buttons\" href=\"hotels.jsp\">View all hotels</a>");
		
	}
	catch (Exception e) {
		out.write("Failed to delete the hotel.");
		out.write(Util.convertExceptionToString(e));
		
	}
		%>
	</div>
	
</body>
</html>