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

	<div align="right">
	<p class="language">Language:
	<s:url id="en" action="Index">
	  <s:param name="request_locale">en</s:param>
	</s:url>
	<s:a href="%{en}">English</s:a>
	<s:url id="fr" action="Index">
	  <s:param name="request_locale">fr</s:param>
	</s:url>
	<s:a href="%{fr}">French</s:a>
	<s:url id="nl" action="Index">
	  <s:param name="request_locale">nl</s:param>
	</s:url>
	<s:a href="%{nl}">Dutch</s:a>
	</p>
	</div>

	<jsp:include page="Header.jsp" />
	<center>
		<h2><s:text name="index.header" /></h2>
		<img src="images/cs-logo-541x288.png"
			 alt="Community Squeeze Logo"
			 width="541" height="288" />
	</center>
	<jsp:include page="Footer.jsp" />
</body>

</html>
