<%@page import="com.comp6000.project.util.Util"%>
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
	<title>Update Place</title>
</head>

<%
	Place place = new Place();
	place.setId(Integer.parseInt(request.getParameter("id")));
	place.setTitle(request.getParameter("title"));
	place.setCity(request.getParameter("city"));
	place.setState(request.getParameter("state"));	
	place.setImageLinks(request.getParameter("images").split("\n"));	
	place.setDescription(request.getParameter("description"));
	
	try {
		PlacesDB.updateNewPlace(place);
	
%>

<body>
	<%@include file="header.jsp" %>		
	<div id="content-area">
		<% 
			out.write("<br>The place <b>" + place.getTitle() + "</b>" + " has been successfully updated.");
			out.write("<br><br><a class=\"buttons\" href=\"places.jsp\">View all places</a>");
	}
	catch (Exception e) {
		out.write("<i style=\"font-size: smaller; color: red\">Update failed. Please check input and try again.</i>");
		out.write(Util.convertExceptionToString(e));
	}
		%>
	</div>
	
</body>

</html>
		