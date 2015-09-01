<%@page import="com.comp6000.project.model.HotelsDB"%>
<%@page import="com.comp6000.project.entity.Hotel"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Boolean loggedIn = (Boolean) session.getAttribute("adminLoggedIn");
	if(loggedIn == null || !loggedIn) 
		response.sendRedirect("adminlogin.jsp");

%>
<head>
	<title>Add a new Hotel</title>
</head>
<html>

<%
	Hotel hotel = new Hotel();

	hotel.setTitle(request.getParameter("title"));
	hotel.setCity(request.getParameter("city"));
	hotel.setState(request.getParameter("state"));
	hotel.setStreetAddr(request.getParameter("street_addr"));
	hotel.setEmail(request.getParameter("email"));
	hotel.setPhone(request.getParameter("phone"));
	hotel.setWeb(request.getParameter("web"));
	hotel.setImageLink(request.getParameter("imageLink"));	
	
	//desc = StringEscapeUtils.escapeHtml4(desc);
	//desc = StringEscapeUtils.escapeJava(desc);

	
	int id = HotelsDB.insertNewHotel(hotel);
	
%>

<body>
	<%@include file="../header.jsp" %>		
	<div id="content-area">
		<% 
			if(id == -1) {
				out.write("<br><i style=font-size: smaller; \"color: red\">Cound not insert hotel into the database. Please check your input.</i>");
			}
			else {
				out.write("<br>The hotel <b>" + hotel.getTitle() + "</b>" + " has been successfully inserted into the database.");
				out.write("<br><br><a class=\"buttons\" href=\"hotels.jsp\">View all hotels</a>");
				
			}
		%>
	</div>
	
</body>

</html>
		