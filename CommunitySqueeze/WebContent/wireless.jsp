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

	<s:hidden name="wirelessMode" />
	<s:hidden name="wirelessKeyMgmt" />

	<!-- hidden store the networkList -->
	<s:iterator value="networkList" status="stat">
	  <s:hidden name="networkList[%{#stat.index}]" value="%{networkList[#stat.index]}" />
	</s:iterator>

<table>

<jsp:include page="interface-non-editable.jsp"/>

<tr>
<td align="right">Wireless&nbsp;Mode</td>
<td><font color="blue"><s:property value="wirelessMode" /></font></td>
</tr>
<tr>
<td align="right">Wireless&nbsp;Key&nbsp;Mgmt</td>
<td><font color="blue"><s:property value="wirelessKeyMgmt" /></font></td>
</tr>
<tr>
<td align="right">
  <s:label>Network&nbsp;Name</s:label>
  <img src='struts/tooltip.gif'
	  title="Choose the Network to connect to. Select a Network ESSID from the drop-down list or select 'User Specified' and enter a value in the box below."
      alt="Choose the Network to connect to. Select a Network ESSID from the drop-down list or select 'User Specified' and enter a value in the box below." />
</td>
<td align="left">
  <s:select name="wirelessEssid" list="networkList" label="ESSID" 
	  tooltip="Choose Network" />
</td>
</tr>
<tr>
<td />
<td align="left">
  <s:textfield name="wirelessEssidOther" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>Wireless&nbsp;Password</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the Wireless Pre Shared Key"
      alt="Set the Wireless Pre Shared Key" />
</td>
<td>
	<s:textfield name="wirelessWpaPsk" label="Wireless PSK" cssClass="size-300px" />
</td>
</tr>
<tr>

<jsp:include page="interface-editable.jsp"/>

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
<h4>Notes</h4>
<p>This configuration page is for the Wireless Network Interface.</p>
<ul>
<li>The <i>Status</i> area at the top of the page, shows the current interface status and 
is the output returned from running the command, <i>ifconfig&nbsp;&lt;interface_name&gt;</i>.
It may be refreshed by pressing the <i>Refresh</i> button.</li>
<li>The <i>Configuration</i> section is used to set interface parameters.</li>
<li>By default, none of the field values are populated. To use the Wireless 
Network Interface you will need to choose a Network to connect to from the 
<i>Network Name</i> (ESSID) drop-down list and enter the <i>Wireless Password</i> 
(pre-shared key).</li>
<li>With none of the other network parameters set, the interface will 
try to obtain an IP Address via dhcp. If you wish to use a static IP Address, 
you should populate the <i>IP Address</i>, <i>Netmask</i> and <i>Gateway</i> 
fields. To enable DNS resolution, you should also populate at least one DNS 
server IP Address (eg. <i>DNS1</i>) and optionally the local network 
<i>Domain</i> name.</li>
<li>If your <i>Network Name</i> (ESSID) is not shown in the drop-down list, 
(perhaps you have set it to &quot;hidden&quot; on your router so it is 
not being broadcast), you may select &quot;User Specified (below):&quot; 
from the <i>Network Name</i> drop-down list and manually enter your 
<i>Network Name</i> (ESSID) in the field below.</li>
<li>Having configured the Wireless Network Interface, press the 
&quot;Save and Reboot&quot; button. The web page will submit the 
parameters you have entered. If any of the values fail server-side validation, 
the web page will return will one (or more) messages, 
<font color="red">highlighted in red</font>, at 
the beginning of the <i>Configuration</i> section. These messages should be 
self-explanatory and enable you to &quot;adjust&quot; the 
indicated parameters, before you attempt to &quot;Save&quot; again.</li>
<li><b>Please take care when you enter the <i>Wireless Password</i>! At present, 
it is not validated and if incorrect will prevent the interface from associating 
with your router!</b></li>
</ul>
<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
