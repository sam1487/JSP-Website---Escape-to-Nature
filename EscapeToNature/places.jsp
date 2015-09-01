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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Places</title>
</head>

<script>
function confirmDelete(id) {
    var txt;
    var r = confirm("Are you sure you want to delete the place?");
    if (r == true) {
        window.location.href="deleteplace.jsp?id=" + id;
    } else {
        
    }    
}
</script>


<%
	Place[] places = PlacesDB.getAllPlaces();
%>
<body>
	<%@include file="header.jsp" %>	
	<div id="content-area">
		<div class="page-title">Places</div>
		<style>
			.entry-table td {
				border-bottom: 1px solid lightblue;
				padding: 10px;
				padding-left: 15px;
			}
		</style>
				
		<table class="entry-table">
		
		
			<%for(Place place : places) {%>
			<tr>
				<td><%= place.getTitle() + ", " + place.getCity() + ", " + place.getState() %></td>
				<td style="text-align: center; width: 50px;"><a class="buttons" href="editplace.jsp?id=<%=place.getId()%>">Update</a></td>
				<td style="text-align: center; width: 50px;"><a onclick="confirmDelete('<%=place.getId()%>')" class="negativeButton" href="#">Delete</a></td>
			</tr>			
			<%}%>
			
		</table>
			
	</div>
</body>
</html>