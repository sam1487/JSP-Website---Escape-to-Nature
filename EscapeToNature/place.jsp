<%@page import="com.comp6000.project.model.HotelsDB"%>
<%@page import="com.comp6000.project.entity.Hotel"%>
<%@page import="com.comp6000.project.model.PlacesDB"%>
<%@page import="com.comp6000.project.entity.Place"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Place</title>
</head>
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> <!-- 33 KB -->			
<!-- fotorama.css & fotorama.js. -->
<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.3/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.3/fotorama.js"></script> <!-- 16 KB -->

<body>
<%
	int placeId = -1;
	Place place = null;
	try {
		placeId = Integer.parseInt(request.getParameter("id"));
		place = PlacesDB.getPlaceFromId(placeId);
	} catch(Exception e) {
		response.sendRedirect("index.jsp");
	}	
%>
	
	<%@include file="header.jsp" %>	
	<div id="content-area">
		<div class="place-header" style="padding-left: 5px;">
			<div style="margin-top: 15px;margin-bottom: 5px; font-weight: 700; font-size: xx-large; color: darkred"><%=place.getTitle()%></div>
			<div style="margin-bottom: 7px; color: rgb(80,80,80)"><%=place.getCity() + ", " + place.getState()%></div>
			<div><b>Ratings:</b> <%=String.format("%.1f", place.getRating())%>/5.0 &nbsp;&nbsp; <b>Minimum Stay: </b> <%
				double recStay = place.getRec_stay();
				if(recStay < 0) out.write("<i>NA</i>");
				else {
					out.write(String.format("%.1f days (average)", place.getRec_stay())); 
				}
			%> </div>
		</div>
		<hr style="margin-bottom: 5px; border: 1px solid orange">		
		
		<%if(place.getImageLinks().length > 0) {%>
			<br>
			<div style="width: 98%; margin: 0 auto">
			<div  class="fotorama" data-height="320" data-width="100%" data-autoplay="true" data-fit="cover">
			<%for(String link : place.getImageLinks()) {%>						
				  <img src="<%=link%>" />		
			<%} %>
			</div></div>
		<%} %>
		
		<%-- <%  if(place.getImageLinks().length > 0) {
				int size = Math.min(3, place.getImageLinks().length);%>		
		
				<table style="margin: 15px auto; width: auto;">
					<tr><td>	
				
				<% 		for(int i = 0; i < size; ++i) { %>
							<a href="<%=place.getImageLinks()[i] %>"><img style="border-radius: 10px; margin-left: 10px; max-width: 200px; margin-right: 10px; height: 150px" src="<%=place.getImageLinks()[i] %>" />
							</a>
				<% 		 }%>
				
					</td></tr>
				</table> 
			<%}%> --%>
			
			
		<div class="place-desc" style="padding: 10px">
			<%=place.getDescription() %>
		</div>
		
		<div class="hotels-list">
			<div class="page-title">Nearby Hotels</div>
			<div class="hotel-list" style="margin-top: 10px; margin-left: 15px;">
				<% 
				Hotel[] hotels = HotelsDB.getHotelsAt(place.getState(), place.getCity()); %> 
				<style>
				.entry-table td {
					border-bottom: 1px solid lightblue;
					padding: 10px;
					padding-left: 2px;
				}
				</style>		
				<table class="entry-table">
					<%for(Hotel hotel : hotels) {%>
					<tr>
						<td style="height: 60px;">
							<img style="float: left; border-radius: 5px; margin: 5px; width: 70px;" src="<%=hotel.getImageLink() %>" /> 
							<div style="margin: 5px; margin-top: 10px; float: left; width: 400px" >
								<span style="font-size: larger"><a href="hotel.jsp?id=<%=hotel.getId()%>"><b><%= hotel.getTitle()%></a></b></span>
								<br>
								<span style="font-size: smaller"><%=hotel.getStreetAddr() + ", " + hotel.getCity() + ", " + hotel.getState()%></span>
							</div>
						</td>
					</tr>			
					<%}%>
					
				</table>				

			</div>		
		</div>
		
		
		
		<div class="feedback" style="margin-top: 20px;">
			<div class="page-title">Feedback</div>
			
			<div style="margin: 15px">
			If you've visited the place, please provide your feedback below.
			<form name="frmFeedback" action="feedback.jsp" method="POST">
			
			<style>
				feedback-table td {
					border-bottom: none
				}
			</style>
			
			<input type="hidden" name="id" value="<%=place.getId()%>" />
			<table class="feedback-table" style="font-size: smaller; background: whitesmoke; padding: 5px; " cellspacing="10">
				
				<tr>
					<td style="width: 180px">Rating: </td>
					<td>
						<select name="rating">
							<option value="0" > 0/5 </option>
							<option value="1" > 1/5 </option>
							<option value="2" > 2/5 </option>
							<option value="3" > 3/5 </option>
							<option value="4" > 4/5 </option>
							<option value="4" > 5/5 </option>
						</select>
					</td>					
				</tr>
				<tr>
					<td>Recommended Stay: </td>
					<td>
						<select name="rec_stay">
							<option value="0" > Less than a day </option>
							<option value="1" > One day </option>
							<option value="2" > Two days </option>
							<option value="3" > Three days </option>
							<option value="7" > A week </option>
							<option value="14" > Two weeks </option>
							<option value="30" > A month </option>
						</select>
					</td>
				</tr>
				<tr><td></td><td><input type="submit" class="buttons" value="Send Feedback" /></td></tr>
			</table>
			</form>
		</div>
		</div>
		
	</div>
	
</body>
</html>