<?xml version="1.0" encoding="UTF-8"?>

<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.comp6000.project.model.HotelsDB"%>
<%@page import="com.comp6000.project.entity.Hotel"%>
<%@page import="com.comp6000.project.entity.Place"%>
<%@page import="com.comp6000.project.model.PlacesDB"%>
<%@ page contentType="text/xml" %>

<%
	String state = request.getParameter("state");
	String city = request.getParameter("city");
	String queryType = request.getParameter("queryType");
	
	// defaulst to places search
	if(queryType == null || queryType.equals(""))
		queryType = "places";
	
	%>
<output>
<%if(queryType.equals("places")) {
	Place[] places;
	
	if(state == null || state.equals("")) {
		places = PlacesDB.getAllPlaces();
	}	
	else if(city == null || city.equals(""))
		places= PlacesDB.getAllPlacesForState(state);
	else 
		places= PlacesDB.getAllPlacesForStateCity(state, city);
	
	if(places == null || places.length == 0) {
		out.write("</output>");
		return; 
	}
	
	out.write("<places>");
	
	for(Place place : places) {
	%>
		

	<%%>
	<place>
		<title><%= StringEscapeUtils.escapeXml10(place.getTitle()) %></title>		
		<rating><%=place.getRating()%></rating>
		<rec_stay><%=place.getRec_stay()%> days</rec_stay>
		<description><![CDATA[
			<%=place.getDescription()%>
			]]>
		</description>
		
		<%if(place.getImageLinks().length == 0) continue; %>
		<images>
		<%for(String link : place.getImageLinks()) {%>
			<image link="<%=link%>" />	
		<%}%>
		</images>			
			
	</place>
	<%}%>
		
</places>
</output>    
<%
	return;
}
else if(queryType.equals("hotels")) {
	Hotel[] hotels = HotelsDB.getHotelsAt(state, city);
	if(state == null || state.equals("")) {
		hotels = HotelsDB.getAllHotels();
	}	
	else if(city == null || city.equals(""))
		hotels = HotelsDB.getHotelsAtState(state);
	else 
		hotels = HotelsDB.getHotelsAt(state, city);
	
	if(hotels == null || hotels.length == 0) {
		out.write("</output>");
		return; 
	}	
%>
<hotels>
	<%for(Hotel hotel : hotels) {%>
	<hotel>
		<title><%= StringEscapeUtils.escapeXml10(hotel.getTitle()) %></title>
		<street_addr><%=StringEscapeUtils.escapeXml10(hotel.getStreetAddr())%></street_addr>
		<phone><%=StringEscapeUtils.escapeXml10(hotel.getPhone())%></phone>
		<email><%=StringEscapeUtils.escapeXml10(hotel.getEmail())%></email>
		<web><%=StringEscapeUtils.escapeXml10(hotel.getWeb())%></web>
		<image_link><%=StringEscapeUtils.escapeXml10(hotel.getImageLink())%></image_link>		
	</hotel>
	<%}%>	
</hotels>
</output>
<%
	return;
}%>

</output>