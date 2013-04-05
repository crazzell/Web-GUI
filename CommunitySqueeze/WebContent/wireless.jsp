<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title>Community Squeeze OS: Wireless Interface Configuration</title>
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
      <h2>Wireless Interface Configuration</h2>
    </td>
  </tr>
</table>

<hr />
<h4>Status</h4>
<s:form action="Wireless" theme="simple" >
<table>
<tr>
<td>
	<s:textarea name="status" cols="100" rows="7" readonly="true" />
</td>
</tr>
<tr>
<td align="right">
	<s:submit action="Wireless_populate" value="Refresh" />
</td>
</tr>
</table>
</s:form>

<hr />

<h4>Configuration</h4>
<s:actionerror />
<s:form action="WirelessSave_save" theme="simple">

	<s:hidden name="name" />
	<s:hidden name="type" />
	<s:hidden name="wirelessMode" />
	<s:hidden name="wirelessKeyMgmt" />
	<s:hidden name="uuid" />
	<s:hidden name="hwAddr" />
	<s:hidden name="zone" />
	<s:hidden name="bootProto" />
	<s:hidden name="onBoot" />

	<s:hidden name="status" />

	<!-- hidden store the networkList -->
	<s:iterator value="networkList" status="stat">
	  <s:hidden name="networkList[%{#stat.index}]" value="%{networkList[#stat.index]}" />
	</s:iterator>

<table>
<tr>
<td align="right">Name</td>
<td><font color="blue"><s:property value="name" /></font></td>
</tr>
<tr>
<td align="right">Type</td>
<td><font color="blue"><s:property value="type" /></font></td>
</tr>
<tr>
<td align="right">Wireless&nbsp;Mode</td>
<td><font color="blue"><s:property value="wirelessMode" /></font></td>
</tr>
<tr>
<td align="right">Wireless&nbsp;Key&nbsp;Mgmt</td>
<td><font color="blue"><s:property value="wirelessKeyMgmt" /></font></td>
</tr>
<tr>
<td align="right">UUID</td>
<td><font color="blue"><s:property value="uuid" /></font></td>
</tr>
<tr>
<td align="right">MAC&nbsp;Addr</td>
<td><font color="blue"><s:property value="hwAddr" /></font></td>
</tr>
<tr>
<td align="right">Firewall&nbsp;Zone</td>
<td><font color="blue"><s:property value="zone" /></font></td>
</tr>
<tr>
<td align="right">Boot&nbsp;Proto</td>
<td><font color="blue"><s:property value="bootProto" /></font></td>
</tr>
<tr>
<td align="right">On&nbsp;Boot</td>
<td><font color="blue"><s:property value="onBoot" /></font></td>
</tr>
<tr>
<td align="right">Network&nbsp;Name</td>
<td>
	<s:select name="wirelessEssid" list="networkList" label="ESSID" 
		tooltip="Choose Network" />
</td>
</tr>
<tr>
<td align="right">Wireless&nbsp;Password</td>
<td>
	<s:textfield name="wirelessWpaPsk" label="Wireless PSK" size="30" />
</td>
</tr>
<tr>
<td align="right">IP&nbsp;Address</td>
<td>
	<s:textfield name="ipAddr0" label="IP Address" size="30" />
</td>
</tr>
<tr>
<td align="right">Netmask</td>
<td>
	<s:textfield name="netmask0" label="Netmask" size="30" />
</td>
</tr>
<tr>
<td align="right">Gateway</td>
<td>
	<s:textfield name="gateway0" label="Gateway" size="30" />
</td>
</tr>
<tr>
<td align="right">DNS1</td>
<td>
	<s:textfield name="dns1" label="DNS1" size="30" />
</td>
</tr>
<tr>
<td align="right">DNS2</td>
<td>
	<s:textfield name="dns2" label="DNS2" size="30" />
</td>
</tr>
<tr>
<td align="right">DNS3</td>
<td>
	<s:textfield name="dns3" label="DNS3" size="30" />
</td>
</tr>
<tr>
<td align="right">Domain</td>
<td>
	<s:textfield name="domain" label="Domain" size="30" />
</td>
</tr>			
<tr>
<td colspan="2" align="right">
	<s:reset key="button.reset" />
	<s:submit value="Save" action="WirelessSave_save" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:submit value="Save and Reboot" action="WirelessSave_saveAndReboot" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:submit value="Refresh Network List" action="Wireless_populate" />
</td>
</tr>
	<!--
	<s:submit value="Interface Up" action="Wireless_up" />
	<s:submit value="Interface Down" action="Wireless_down" />
	<s:submit value="Interface Down / Interface Up" action="Wireless_downUp" />
	-->
</table>
</s:form>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
