<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title>Community Squeeze OS: Ethernet Interface Configuration</title>
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
      <h2>Ethernet Interface Configuration</h2>
    </td>
  </tr>
</table>

<hr />
<h4>Status</h4>
<s:form action="Ethernet_populate" theme="simple" >
<table>
<tr>
<td>
  <s:textarea name="status" cols="100" rows="7" readonly="true" />
</td>
</tr>
<tr>
<td align="right">
  <s:submit action="Ethernet_populate" value="Refresh" />
</td>
</tr>
</table>
</s:form>

<hr />

<h4>Configuration</h4>
<s:actionerror />
<s:form action="EthernetSave_save" theme="simple">
					
<table>

<jsp:include page="interface-non-editable.jsp"/>
<jsp:include page="interface-editable.jsp"/>

<tr>
<td colspan="2" align="right">
	<s:reset key="button.reset" />
	<s:submit value="Save" action="EthernetSave_save" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:submit value="Save and Reboot" action="EthernetSave_saveAndReboot" />
</td>
</tr>
	<!--
	<s:submit value="Interface Up" action="Ethernet_up" />
	<s:submit value="Interface Down" action="Ethernet_down" />
	<s:submit value="Interface Down / Interface Up" action="Ethernet_downUp" />
	-->
</table>
</s:form>

<hr />
<h4>Notes</h4>
<p>This configuration page is for the Ethernet Network Interface.</p>
<ul>
<li>The <i>Status</i> area at the top of the page, shows the current interface status and 
is the output returned from running the command, <i>ifconfig&nbsp;&lt;interface_name&gt;</i>.
It may be refreshed by pressing the <i>Refresh</i> button.</li>
<li>The <i>Configuration</i> section is used to set interface parameters.</li>
<li>By default, none of the field values are populated and the interface will 
try to obtain an IP Address via dhcp. If you wish to use a static IP Address, 
you should populate the <i>IP Address</i>, <i>Netmask</i> and <i>Gateway</i> 
fields. To enable DNS resolution, you should also populate at least one DNS 
server IP Address (eg. <i>DNS1</i>) and optionally the local network 
<i>Domain</i> name.</li>
<li>Having configured the Ethernet Network Interface, press the 
&quot;Save and Reboot&quot; button. The web page will submit the 
parameters you have entered. If any of the configuration parameters 
fail server-side validation, 
the web page will return with one (or more) messages, 
<font color="red">highlighted in red</font>, at 
the beginning of the <i>Configuration</i> section. These messages should be 
self-explanatory and enable you to &quot;adjust&quot; the 
indicated parameters, before you attempt to submit them again.
If the parameters you have entered pass validation, the device will be rebooted 
and the network interface initialised using the saved parameters.</li>
</ul>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
