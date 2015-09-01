<%@page import="com.comp6000.project.model.PlacesDB"%>
<%@page import="com.comp6000.project.entity.Place"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Places</title>
</head>

<%

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
		<div class="search-bar" style="padding: 10px;border: 1px solid lightgrey; background: whitesmoke; margin: 5px auto; width: 400px; text-align: center; margin-bottom: 30px;">
			<form name="search-place" method="GET" action="viewplaces.jsp">				
				<span style="font-size: smaller">Choose a State:</span> &nbsp; 
			
		
				<select id="states" name="state" style="width: 40%;">
						<option>All States</option>
						<option>Alabama</option>
						<option>Alaska</option>
						<option>Arizona</option>
						<option>Arkansas</option>
						<option>California</option>
						<option>Colorado</option>
						<option>Connecticut</option>
						<option>Delaware</option>
						<option>Florida</option>
						<option>Georgia</option>
						<option>Hawaii</option>
						<option>Idaho</option>
						<option>Illinois</option>
						<option>Indiana</option>
						<option>Iowa</option>
						<option>Kansas</option>
						<option>Kentucky</option>
						<option>Louisiana</option>
						<option>Maine</option>
						<option>Maryland</option>
						<option>Massachusetts</option>
						<option>Michigan</option>
						<option>Minnesota</option>
						<option>Mississippi</option>
						<option>Missouri</option>
						<option>Montana</option>
						<option>Nebraska</option>
						<option>Nevada</option>
						<option>New Hampshire</option>
						<option>New Jersey</option>
						<option>New Mexico</option>
						<option>New York</option>
						<option>North Carolina</option>
						<option>North Dakota</option>
						<option>Ohio</option>
						<option>Oklahoma</option>
						<option>Oregon</option>
						<option>Pennsylvania</option>
						<option>Rhode Island</option>
						<option>South Carolina</option>
						<option>South Dakota</option>
						<option>Tennessee</option>
						<option>Texas</option>
						<option>Utah</option>
						<option>Vermont</option>
						<option>Virginia</option>
						<option>Washington</option>
						<option>West Virginia</option>
						<option>Wisconsin</option>
						<option>Wyoming</option>
						</select>
				&nbsp;<input type="submit" value="Search" />
			</form>		
		</div>
		
			<%
			String state = request.getParameter("state");
			if(state != null && !state.equals("")) {%>
				<script>
					<% out.write("document.getElementById('states').value='"+ state +"';"); 
					%>
				</script>
			
			<%}
			%>
		
		<%
			String query = request.getParameter("state");
			Place[] places;
			
			if(query == null || query.equals("") || query.equals("All States")) {
				
				places = PlacesDB.getAllPlaces();
			}
			else {
				
				places = PlacesDB.getAllPlacesForState(query);
			}
			if(places.length == 0) {
				
				out.write("No places found in the database");
				if(query != null && !query.equals("")) out.write(" for " + query);
				else out.write(".");
				out.write("</div>");
				return;
			}
		%>		
		<table class="entry-table">		
			<%for(Place place : places) {%>
			<tr>
				<td style="height: 70px; vertical-align: middle;">
					<div style="float: left; width: 80px; margin: 5px; text-align: center">
						<%
							String src = "";
							if(place.getImageLinks().length > 0)
								src = place.getImageLinks()[0];
						%>
						<img style="height: 55px; max-width: 65px; border-radius: 5px" src="<%= src %>" />
					</div>
					<div style="margin-top: 5px; line-height: 1.5; width: 400px; float: left">
						<b><a href="place.jsp?id=<%=place.getId()%>"><%= place.getTitle()%></a> </b><br>
						<span style="color: rgb(80,80,80)"><%=place.getCity() + ", " + place.getState() %></span>				
					</div>				
				</td>
			</tr>			
			<%}%>
			
		</table>
		
	</div>
</body>
</html>