<%@page import="com.comp6000.project.util.Util"%>
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
<title>Delete Place</title>
</head>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Place place = null;
	try {
		place = PlacesDB.getPlaceFromId(id);
		PlacesDB.removePlace(id); 		
		response.sendRedirect("places.jsp");
%>

<body>
	<%@include file="header.jsp" %>		
	<div id="content-area">
	<% 
		out.write("<br>The place <b>" + place.getTitle() + "</b>" + " has been successfully removed from the database.<br><br>");
		out.write("<a class=\"buttons\" href=\"places.jsp\">View all places</a><br>");
	}
	catch (Exception e) {
		out.write("Failed to delete the place.");
		out.write(Util.convertExceptionToString(e));
	}
		%>
	</div>
	
</body>
</html>