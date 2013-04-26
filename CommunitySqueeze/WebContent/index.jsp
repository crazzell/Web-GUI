<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title><s:text name="index.title" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="html/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="favicon.ico" rel="icon" type="image/x-icon" />
	<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>

<body>
	<!-- Header -->
	<jsp:include page="Header.jsp" />
	
	<!-- Language -->
	<jsp:include page="Language.jsp" />
	
	<!-- Logo -->
	<center>
		<h2><s:text name="index.header" /></h2>
		<img src="html/images/cs-logo-541x288.png"
			 alt="Community Squeeze Logo"
			 width="541" height="288" />
	</center>
	
	<!-- Footer -->
	<jsp:include page="Footer.jsp" />
</body>

</html>
