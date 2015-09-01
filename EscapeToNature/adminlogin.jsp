<%@page import="com.comp6000.project.model.AdminsDB"%>
<%@page import="com.comp6000.project.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	String error = "";
	if(username != null && !username.equals("")) {
		Admin admin = AdminsDB.getAdminFromUname(username);
		if(admin != null) {
			session.setAttribute("adminLoggedIn", true);
			response.sendRedirect("admin.jsp");
			error = "";
		}
		else {
			error = "Invalid username/password combination.";
		}
	}
	else if((username != null && username.equals("") || (password != null && password.equals("")))) {
			error = "Invalid username/password combination.";
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
</head>

<body>
	<%@include file="header.jsp" %>	
	<div id="content-area">
		<div class="page-title">Admin Login</div>
		<br>
		<div style="margin-left: 5px">Please log in as the administrator.</div>
		<br>
		<%if(!error.equals("")) { %>
			<div style="margin-left: 5px; color: red; font-style: italic;"><%=error %></div>
			<br>
		<%} %>
		<form name="frmLogin" action="adminlogin.jsp" method="GET">
		<table class="entry-table" style="padding: 5px; width: 300px;" cellspacing="10">
			<tr><td style="width: 100px;">Username: </td> <td><input style="width: 200px" type="text" name="username" /></td></tr>
			<tr><td>Password: </td> <td><input style="width: 200px" type="password" name="password" /></td></tr>
			<tr><td></td> <td></td></tr>
			<tr><td> </td> <td><input type="submit" class="buttons" value="Login" /></td></tr>		
		</table>
		</form>
		
	</div>
		
	
</body>
</html>