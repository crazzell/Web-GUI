<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <title><s:text name="help.title" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
      <h2><s:text name="help.header" /></h2>
    </td>
  </tr>
</table>

<hr />

<h4><s:text name="header.help" /></h4>
<p>Coming soon...</p>
<p>In the meantime, some configuration pages have a Notes section at the bottom 
   of the page.</p>
<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
