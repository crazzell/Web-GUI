<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title><s:text name="error.title" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="html/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="favicon.ico" rel="icon" type="image/x-icon" />
	<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>

<body>
	<jsp:include page="Header.jsp" />

	<table>
		<tr>
			<td>
				<s:a href="index.jsp">
				<img src="html/images/cs-logo-146x50.png" 
					 alt="Community Squeeze Logo" 
					 width="146" height="50" />
				</s:a>
			</td>
			<td>
				<h2><s:text name="error.header" /></h2>
			</td>
		</tr>
	</table>

	<!--
	<p>
	    Please report this error to your system administrator
	    or appropriate technical support personnel.
	    Thank you for your cooperation.
	</p>
	-->

	<hr />
	<h3><s:text name="header.errorMessage" /></h3>
	<s:actionerror />
	<p><s:property value="%{exception.message}" /></p>

	<hr />
	<h3><s:text name="header.techDetails" /></h3>
	<p><s:property value="%{exceptionStack}" /></p>

	<hr />
	<jsp:include page="Footer.jsp" />
</body>
</html>
