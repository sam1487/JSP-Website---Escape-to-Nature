<%@page import="java.util.Date"%>

<div id="common-info-header"
	style="border: 1px solid gainsboro;width: 790px; height: 50px; margin: 0 auto; margin-top: 5px; font-size: small; background: #FFFFEA; border-bottom: 3px solid orange; padding: 15px; padding-top:0">
	<div id="app-info" style="float: left; width: 400px">
		<h1 style="margin-top: 15px">Escape to Nature</h1>
	</div>
	<div id="assignment-info"
		style="padding-left: 7px; padding-top: 5px; padding-bottom: 5px; border-left: 3px solid orange; float: right; width: 300px">
		<h3 style="margin: 0; padding: 0">Term Project</h3>
		<h3 style="margin: 0;">COMP-6000-001 Sp 2015</h3>
		<h4 style="margin-top: 5px; font-weight: 100; margin-bottom: 2px">
			Samir Hasan (szh0064@auburn.edu)</h4>
	</div>	
</div>
<style>
body {
	font-family: helvetica, arial;
	background: blue;
}
</style>
<style>
	
.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #54a3f7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #54a3f7;
	box-shadow:inset 0px 1px 0px 0px #54a3f7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #007dc1), color-stop(1, #0061a7));
	background:-moz-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-webkit-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-o-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-ms-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:linear-gradient(to bottom, #007dc1 5%, #0061a7 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#007dc1', endColorstr='#0061a7',GradientType=0);
	background-color:#007dc1;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
	border:1px solid #124d77;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #154682;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0061a7), color-stop(1, #007dc1));
	background:-moz-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-webkit-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-o-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-ms-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0061a7', endColorstr='#007dc1',GradientType=0);
	background-color:#0061a7;
}
.myButton:active {
	position:relative;
	top:1px;
}

	.page-title {
		padding: 10px;
		padding-bottom: 5px;
		
		border-bottom: 2px solid darkorange;
		font-weight: 700;
		font-size: large;
	}
	
	body { 
		width: 100%;
		background: whitesmoke;
		margin: auto auto;
	}
	#content-area {
		width: 800px;
		margin: 0 auto;
		border: 1px solid gainsboro;
		background: white;
		padding: 10px;
	}
	#search-area {
		text-align: center;
		width: 500px;
		margin: 5px auto;
		padding: 5px;
		padding-bottom: 10px;
	}
	
	#list-box {
		margin: 10px auto auto auto;
		border-top: 2px solid darkgrey;
	}
	.album-row{
		padding: 10px;
		border-bottom: 1px solid lightblue;
		margin-top: 5px;
		height: 80px;
		line-height: 1.5;
	}
	.album-thumbnail{
		float: left;
		widht: 100px;
		vertical-align: center;
	}
	.album-content {
		float: left;
		width: 600px;
		padding-left: 10px;
	}
	.album-meta {
		font-size: smaller;
		
	}
	a {
		font-style: normal;
		text-decoration: none;
	}
	
	.entry-table, .feedback-table {
		width: 90%;
		margin-top: 5px;
		margin-left: auto;
		margin-right: auto;
		
	}
	.entry-table input[type="text"], .entry-table input[type="password"], .entry-table textarea {
		padding: 5px;
		
		border: 1px solid gainsboro;
		width: 300px;
	}
	
	
.buttons {
	-moz-box-shadow: 0px 10px 14px -7px #9fb4f2;
	-webkit-box-shadow: 0px 10px 14px -7px #9fb4f2;
	box-shadow: 0px 10px 14px -7px #9fb4f2;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #7892c2), color-stop(1, #476e9e));
	background:-moz-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-webkit-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-o-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:-ms-linear-gradient(top, #7892c2 5%, #476e9e 100%);
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7892c2', endColorstr='#476e9e',GradientType=0);
	background-color:#7892c2;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	border:1px solid #4e6096;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
	text-shadow:0px 1px 0px #283966;
}
.buttons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #476e9e), color-stop(1, #7892c2));
	background:-moz-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-webkit-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-o-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:-ms-linear-gradient(top, #476e9e 5%, #7892c2 100%);
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#476e9e', endColorstr='#7892c2',GradientType=0);
	background-color:#476e9e;
}
.buttons:active {
	position:relative;
	top:1px;
}
.negativeButton {
	-moz-box-shadow: 0px 10px 14px -7px #f5978e;
	-webkit-box-shadow: 0px 10px 14px -7px #f5978e;
	box-shadow: 0px 10px 14px -7px #f5978e;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f));
	background:-moz-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:-webkit-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:-o-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:-ms-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background:linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f',GradientType=0);
	background-color:#f24537;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}
.negativeButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537));
	background:-moz-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:-webkit-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:-o-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:-ms-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background:linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537',GradientType=0);
	background-color:#c62d1f;
}
.negativeButton:active {
	position:relative;
	top:1px;
}

</style>
	
	<div id="menu" style=" margin: 0 auto; width: 810px; padding: 5px 5px; background: lightblue; border: 1px solid gainsboro">
		<a href="index.jsp" class="myButton">Home</a>
		<a href="viewplaces.jsp" class="myButton">Places</a>
		<a href="viewhotels.jsp" class="myButton">Hotels</a>
		<a href="admin.jsp" class="myButton">Admin</a>
		<a href="contact.jsp" class="myButton">Contact</a>
		
		<%
		//session.setAttribute("adminLoggedIn", true);
		Boolean adminLoggedIn = (Boolean)session.getAttribute("adminLoggedIn");
		if(adminLoggedIn != null && adminLoggedIn == true) {%>
			<a href="logout.jsp" id="btnLogout" class="myButton">Log Out</a>			
		<%}%>
	</div>

