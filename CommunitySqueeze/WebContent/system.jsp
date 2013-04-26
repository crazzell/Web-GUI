<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <title><s:text name="configuration.title" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link href="html/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="favicon.ico" rel="icon" type="image/x-icon" />
  <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>

<jsp:include page="Header.jsp"/>

<table>
  <tr>
    <td>
	  <s:a action="Index">
      	<img src="html/images/cs-logo-146x50.png" 
      		 alt="Community Squeeze Logo" 
      		 width="146" height="50" />
      </s:a>
    </td>
    <td>
      <h2><s:text name="configuration.header" /></h2>
    </td>
  </tr>
</table>

<hr />

<h4><s:text name="header.timezone" /></h4>
<s:form action="Configuration_timeZone" theme="simple" >
<table>
<tr>
<td align="right">
	<s:text name="configuration.label.timeZone" />
	<img src='struts/tooltip.gif'
	  	 title="<s:property value="getText('configuration.tooltip.timeZone')" />"
      	 alt="<s:property value="getText('configuration.tooltip.timeZone')" />" />
</td>
<td>
	<s:select name="timeZone" list="timeZoneList" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:reset key="button.reset"/>
	<s:submit action="Configuration_timeZone" 
			  key="button.submit" />
</td>
</tr>
</table>
</s:form>

<hr />
<h4><s:text name="header.notes" /></h4>
<p><s:text name="configuration.notes.desc" /></p>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
