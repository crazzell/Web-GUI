<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title>Community Squeeze OS: Shutdown</title>
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="images/favicon.ico" rel="icon" type="image/x-icon" />
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>

<jsp:include page="Header.jsp"/>

<table>
  <tr>
    <td>
      <a href="index.jsp"><img src="images/cs-logo-146x50.png" alt="Community Squeeze Logo" width="146" height="50" /></a>
    </td>
    <td>
      <h2>Shutdown: Reboot or Halt the device</h2>
    </td>
  </tr>
</table>

<hr />

<h4>Control</h4>
<s:form action="Reboot" theme="simple" >
<table>
<tr>
<td align="right"><s:submit value="Halt" action="Halt" theme="simple" /></td>
<td>To halt the device, press the <b>Halt</b> button and wait at least 30 seconds before removing power 
for the process to complete.</td>
</tr>
<tr>
<td align="right"><s:submit value="Reboot" action="Reboot" theme="simple" /></td>
<td>To reboot the device, press the <b>Reboot</b> button.<td>
</tr>
</table>
</s:form>

<hr />
<h4>Notes</h4>
<p>This configuration page is for the Rebooting and Halting the device.</p>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
