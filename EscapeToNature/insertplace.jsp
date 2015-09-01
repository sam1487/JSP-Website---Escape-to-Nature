<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="com.comp6000.project.model.PlacesDB"%>
<%@page import="com.comp6000.project.entity.Place"%>
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
	<title>Add a new Place</title>
</head>
<%
	Place place = new Place();

	place.setTitle(request.getParameter("title"));
	place.setCity(request.getParameter("city"));
	place.setState(request.getParameter("state"));	
	place.setImageLinks(request.getParameter("images").split("\n"));
	String desc = request.getParameter("description");
	
	//desc = StringEscapeUtils.escapeHtml4(desc);
	//desc = StringEscapeUtils.escapeJava(desc);
	
	place.setDescription(desc);
	
	System.out.println(desc);
	
	
	int id = PlacesDB.insertNewPlace(place);
	
%>

<body>
	<%@include file="header.jsp" %>		
	<div id="content-area">
		<% 
			if(id == -1) {
				out.write("<br><i style=font-size: smaller; \"color: red\">Cound not insert place into the database. Please check your input.</i>");
			}
			else {
				out.write("<br>The place <b>" + place.getTitle() + "</b>" + " has been successfully inserted into the database.");
				out.write("<br><br><a class=\"buttons\" href=\"places.jsp\">View all places</a>");
			}
		%>
	</div>
	
</body>

</html>
		