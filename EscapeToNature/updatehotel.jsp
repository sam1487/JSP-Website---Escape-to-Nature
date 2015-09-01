<%@page import="com.comp6000.project.util.Util"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.comp6000.project.model.HotelsDB"%>
<%@page import="com.comp6000.project.entity.Hotel"%>
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
	<title>Update Hotel</title>
</head>

<body>
	<%@include file="header.jsp" %>		
	<div id="content-area">
<%
try {

	Hotel hotel = new Hotel();
	hotel.setId(Integer.parseInt(request.getParameter("id")));
	hotel.setTitle(request.getParameter("title"));
	hotel.setCity(request.getParameter("city"));
	hotel.setState(request.getParameter("state"));	
	hotel.setStreetAddr(request.getParameter("street_addr"));
	hotel.setPhone(request.getParameter("phone"));
	hotel.setEmail(request.getParameter("email"));
	hotel.setWeb(request.getParameter("web"));
	hotel.setImageLink(request.getParameter("imageLink"));	
	
		
	HotelsDB.updateHotel(hotel);
	
	out.write("<br>The hotel <b>" + hotel.getTitle() + "</b>" + " has been successfully updated.");
	out.write("<br><br><a class=\"buttons\" href=\"hotels.jsp\">View all hotels</a>");
}
catch (Exception e) {
	out.write(Util.convertExceptionToString(e));
	/* out.write("<i style=\"font-size: smaller; color: red\">Update failed. Please check input and try again.</i>");
	out.write("<br><br>Reason: ");
	out.write("<div style=\"padding: 7px; font-family: courier;background: lightyellow; font-size: smaller; overflow: scroll\">");
	StringWriter sw = new StringWriter();
	PrintWriter pw = new PrintWriter(sw);
	e.printStackTrace(pw);
	out.write(sw.toString());
	out.write("</div>"); */
}
%>
	</div>
	
</body>

</html>
		