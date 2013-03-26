<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Community Squeeze OS: Wireless Interface Configuration</title>
</head>
<body>
<table>
  <tr>
    <td>
      <a href="index.jsp"><img src="cs-logo-146x50.png" alt="Community Squeeze Logo" width="146" height="50" /></a>
    </td>
    <td>
      <h2>Wireless Interface Configuration</h2>
    </td>
  </tr>
</table>

<hr />
<s:actionerror />

<s:form action="Wireless" theme="simple" >
	<s:textarea name="status" cols="100" rows="7"/>
	<br />
	<s:submit action="Wireless_populate" value="Status" />
</s:form>

<hr />

<s:form action="Wireless" >
	<s:select name="wirelessEssid" list="networkList" label="ESSID" 
		tooltip="Choose Network" />
	<s:textfield name="wirelessWpaPsk" label="Wireless PSK" />
		
	<s:hidden name="name" />
	Name: <s:property value="name" /><br />
	<s:hidden name="type" />
	Type: <s:property value="type" /><br />
	<s:hidden name="wirelessMode" />
	Wireless Mode: <s:property value="wirelessMode" /><br />
	<s:hidden name="wirelessKeyMgmt" />
	Wireless Key Mgmt: <s:property value="wirelessKeyMgmt" /><br />
	<s:hidden name="uuid" />
	UUID: <s:property value="uuid" /><br />
	<s:hidden name="hwAddr" />
	MAC Addr: <s:property value="hwAddr" /><br />
	<s:hidden name="zone" />
	Firewall Zone: <s:property value="zone" /><br />
	<s:hidden name="bootProto" />
	Boot Proto: <s:property value="bootProto" /><br />
	<s:hidden name="onBoot" />
	On Boot: <s:property value="onBoot" /><br />

	<s:textfield name="ipAddr0" label="IP Address" />
	<s:textfield name="prefix0" label="Prefix" />
	<s:textfield name="gateway0" label="Gateway" />
	<s:textfield name="dns1" label="DNS1" />
	<s:textfield name="dns2" label="DNS2" />
	<s:textfield name="dns3" label="DNS3" />
	<s:textfield name="domain" label="Domain" />
		
	<s:submit value="Save" action="Wireless_save" align="left" />
	<s:reset key="button.reset" align="left" />

	<s:submit value="Reboot" action="Wireless_reboot" />
	<s:submit value="Interface Up" action="Wireless_up" />
	<s:submit value="Interface Down" action="Wireless_down" />
	<s:submit value="Interface Down / Interface Up" action="Wireless_downUp" />
			
</s:form>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
