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
	<title>Home</title>
</head>

<body>
	<%@include file="header.jsp" %>	
	<div id="content-area">
		<div class="page-title">Admin Panel</div>
		
		<h4 style="padding-left: 8px; margin-bottom: 0px;">Places</h4>
		<ul style="line-height: 1.4">
			<li><a href="addplace.jsp">Add Place</a></li>
			<li><a href="places.jsp">Edit/Remove Place</a></li>
		</ul>
		
		<h4 style="padding-left: 8px; margin-bottom: 0px">Hotels</h4>
		<ul style="line-height: 1.4">			
			<li><a href="addhotel.jsp">Add Hotel</a></li>
			<li><a href="hotels.jsp">Edit/Remove Hotel</a></li>
		</ul>
	</div>
		
</body>
</html>