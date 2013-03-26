<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Community Squeeze OS: Squeeze Server Control</title>
</head>
<body>
<table>
  <tr>
    <td>
      <a href="index.jsp"><img src="cs-logo-146x50.png" alt="Community Squeeze Logo" width="146" height="50" /></a>
    </td>
    <td>
      <h2>Squeeze Server Control</h2>
    </td>
  </tr>
</table>

<hr />
<s:actionerror />

<s:form action="SqueezeServer" theme="simple" >
	<s:textarea name="status" cols="100" rows="8"/>
	<br />
	<s:submit action="SqueezeServer_populate" value="Status" />
	<s:submit action="SqueezeServer_enableService" value="Enable" />
	<s:submit action="SqueezeServer_disableService" value="Disable" />
	<s:submit action="SqueezeServer_startService" value="Start" />
	<s:submit action="SqueezeServer_stopService" value="Stop" />
	<s:submit action="SqueezeServer_restartService" value="Restart" />
</s:form>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>