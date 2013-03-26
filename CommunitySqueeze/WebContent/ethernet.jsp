<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Community Squeeze OS: Ethernet Interface Configuration</title>
</head>
<body>
<table>
  <tr>
    <td>
      <a href="index.jsp"><img src="cs-logo-146x50.png" alt="Community Squeeze Logo" width="146" height="50" /></a>
    </td>
    <td>
      <h2>Ethernet Interface Configuration</h2>
    </td>
  </tr>
</table>

<hr />
<s:actionerror />

<s:form action="Ethernet" theme="simple" >
	<s:textarea name="status" cols="100" rows="7"/>
	<br />
	<s:submit action="Ethernet_populate" value="Status" />
</s:form>

<hr />

<s:form action="Ethernet" >
	
	<s:hidden name="name" />
	Name: <s:property value="name" /><br />
	<s:hidden name="type" />
	Type: <s:property value="type" /><br />
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
	
	<s:submit value="Save" action="Ethernet_save" align="left" />
	<s:reset key="button.reset" align="left" />
	<s:submit value="Reboot" action="Ethernet_reboot" />
	<s:submit value="Interface Up" action="Ethernet_up" />
	<s:submit value="Interface Down" action="Ethernet_down" />
	<s:submit value="Interface Down / Interface Up" action="Ethernet_downUp" />
	
</s:form>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
