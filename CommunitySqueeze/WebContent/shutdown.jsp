<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title><s:text name="shutdown.title" /></title>
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="images/favicon.ico" rel="icon" type="image/x-icon" />
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>

<jsp:include page="Header.jsp"/>

<table>
  <tr>
    <td>
      <a href="index.jsp">
        <img src="images/cs-logo-146x50.png" 
             alt="Community Squeeze Logo" 
             width="146" height="50" />
      </a>
    </td>
    <td>
      <h2><s:text name="shutdown.header" /></h2>
    </td>
  </tr>
</table>

<hr />

<h4><s:text name="header.control" /></h4>
<s:form action="Reboot" theme="simple" >
<table>
<tr>
<td align="right">
  <s:submit key="button.halt" action="Halt" />
</td>
<td>
  <s:text name="shutdown.halt.mesg" />
</td>
</tr>
<tr>
<td align="right">
  <s:submit key="button.reboot" action="Reboot" />
</td>
<td>
  <s:text name="shutdown.reboot.mesg" />
<td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
<td align="right">
  <s:checkbox name="cbForceReboot" />
</td>
<td>
  <s:text name="cb.forceRebootHalt" />
</td>
</tr>
</table>
</s:form>

<hr />
<h4><s:text name="header.notes" /></h4>
<p><s:text name="shutdown.notes.desc" /></p>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
