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
<title>Add a New Place</title>

<script type="text/javascript" src="scripts/tinymce/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
tinymce.init({
	theme: 'modern',
    mode: "exact",
    elements : "description"
 });
</script>

</head>

<script>
function validateForm(frmName){
	
	reqFields = ['title', 'city', 'images'];
	msgFields = ['Please enter a title',
	             'Enter a city',
	             'Please proive at least one image link (3 recommended)',	             
	             ];
	
	for(i = 0; i < reqFields.length; ++i) {
		var elem = document.forms[frmName][reqFields[i]];
		
		if(elem.value.length == 0) {
			alert(msgFields[i]);
			elem.focus();
			return
		}
	}
	document.forms[frmName].submit()        
}
</script>



<body>
	<%@include file="header.jsp" %>	
	<div id="content-area">
		<div class="page-title">Add Place</div>
		
		
		<form name="frmPlace" action="insertplace.jsp" method="POST" >
			<table class="entry-table" cellspacing="10">
				<tr>
					<td style="width: 70px;">Title:</td>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td>City:</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td>State:</td>
					<td><select id="states" name="state">
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
						</td>
				</tr>
				<tr>
					<td style="vertical-align: top">Images:</td>
					<td><i style="font-size: smaller">One link per line</i><br>
						<textarea name ="images" rows="8" style="width: 100%"></textarea>
					</td>
				</tr>
				<tr>
					<td style="vertical-align: top">Description:</td>
					<td><textarea id ="description" name="description" rows="15" style="width: 100%"></textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input  class="buttons" type="button" onClick="validateForm('frmPlace')" value="Add Place" />
						<input  class="buttons" type="reset" value="Clear" />
					</td>
				</tr>
			</table>
		</form>		
	</div>
</body>
</html>