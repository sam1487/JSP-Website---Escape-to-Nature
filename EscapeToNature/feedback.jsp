<%@page import="com.comp6000.project.util.Util"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="com.comp6000.project.model.PlacesDB"%>
<%@page import="com.comp6000.project.entity.Place"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Feedback</title>
</head>
<body>
	<%@include file="header.jsp" %>		
	<div id="content-area">
	<%
	try {
		int id = Integer.parseInt(request.getParameter("id"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		int rec_stay = Integer.parseInt(request.getParameter("rec_stay"));
		
		Place place = PlacesDB.getPlaceFromId(id);
		
		double currentRating = place.getRating();
		double currentStay = place.getRec_stay();
		
		if(currentRating < 0) currentRating = 0;
		if(currentStay < 0) currentStay = 0;
		
		int nRatings = place.getN_ratings();
		int nRecs = place.getN_recs();
		
		double newRating = ((currentRating * nRatings) + rating) / (nRatings + 1);
		double newRecs = ((currentStay * nRecs) + rec_stay) / (nRecs + 1);
		
		place.setRating(newRating);
		place.setRec_stay(newRecs);
		place.setN_ratings(nRatings + 1);
		place.setN_recs(nRecs + 1);
		
		PlacesDB.updateNewPlace(place);
		
		out.write("<br><br>Feeback recorded successfully");
		out.write("<br><br><a class=\"buttons\" href=\"place.jsp?id=" + place.getId() +"\">Back to the article</a>");
	}
	catch(Exception e) {
		out.write("<i style=\"font-size: smaller; color: red\">Could not save your feedback. Please check input and try again.</i>");
		out.write(Util.convertExceptionToString(e));			
	}
		
	%>
	
	</div>
	

</body>
</html>