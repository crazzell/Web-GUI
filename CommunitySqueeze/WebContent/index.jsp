<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title><s:text name="index.title" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="images/favicon.ico" rel="icon" type="image/x-icon" />
	<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>

<body>
	
	<!-- Header -->
	<jsp:include page="Header.jsp" />

	<!-- Language -->
	<div align="right">
	<p class="language">Language:
	
	<s:url id="en">
	  <s:param name="request_locale">en</s:param>
	</s:url>
	<s:a href="%{en}">English</s:a>
	
	<s:url id="fr">
	  <s:param name="request_locale">fr</s:param>
	</s:url>
	<s:a href="%{fr}">French</s:a>
	
	<s:url id="nl">
	  <s:param name="request_locale">nl</s:param>
	</s:url>
	<s:a href="%{nl}">Dutch</s:a>
	
	<s:url id="de">
	  <s:param name="request_locale">de</s:param>
	</s:url>
	<s:a href="%{de}">German</s:a>
	
	<s:url id="it">
	  <s:param name="request_locale">it</s:param>
	</s:url>
	<s:a href="%{it}">Italian</s:a>
	
	<s:url id="sv">
	  <s:param name="request_locale">sv</s:param>
	</s:url>
	<s:a href="%{sv}">Swedish</s:a>
	
	</p>
	</div>

	<!-- Logo -->
	<center>
		<h2><s:text name="index.header" /></h2>
		<img src="images/cs-logo-541x288.png"
			 alt="Community Squeeze Logo"
			 width="541" height="288" />
	</center>
	
	<!-- Footer -->
	<jsp:include page="Footer.jsp" />
</body>

</html>
