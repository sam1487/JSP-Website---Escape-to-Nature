<%@page import="com.comp6000.project.model.HotelsDB"%>
<%@page import="com.comp6000.project.entity.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hotel</title>
</head>
<body>
	<%@include file="header.jsp" %>	
	<div id="content-area">
	
	<% 
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		Hotel hotel = HotelsDB.getHotelForId(id);
		
	%>
		<div class="place-header" style="padding-left: 5px; height: 155px">
			<div style="margin-top: 13px; width: 180px; float: left; text-align: center">
				<img style="border-radius: 5px; max-width: 175px; height: 140px" src="<%=hotel.getImageLink() %>" />	
			</div>
			<div style="margin-left: 10px; width: 500px; float: left">
				<div style="margin-top: 8px;margin-bottom: 5px; font-weight: 700; font-size: xx-large; color: darkred"><%=hotel.getTitle()%></div>
				<div style="margin-bottom: 3px; color: rgb(80,80,80)"><%=hotel.getStreetAddr()%></div>
				<div style="margin-bottom: 3px; color: rgb(80,80,80)"><%=hotel.getCity() + ", " + hotel.getState()%></div>
				<div style="margin-bottom: 3px;"><b>Phone:</b> <%=hotel.getPhone()%></div>
				<div style="margin-bottom: 3px;"><b>Email:</b> <%=hotel.getEmail()%></div>
				<div style="margin-bottom: 3px;"><b>Web:</b> <%=hotel.getWeb()%></div>
			</div>
		</div>
		<br>
		<br>
		<div class="page-title">Location</div>		
		
		<% 
		String addr = hotel.getStreetAddr() + "," + hotel.getCity() + ", " + hotel.getState();
		addr = addr.replace(" ", "+");
		
		%>
		<div style="width: 680px; margin: 10px auto">
		<iframe
		    width="100%"
		    height="500"
		    frameborder="0" style="border:0"
		    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAA596F9ysJ-3zOcYWLJS_PbaEl0jgbgBI
		      &q=<%=addr%>">
		  </iframe>
		
		</div>

	<%} catch(Exception e) {
		
		
	}%>
		
		
		
	
  
</body>
</html>