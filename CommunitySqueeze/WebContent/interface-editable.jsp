<%@ taglib uri="/struts-tags" prefix="s" %>

<tr>
<td align="right">
  <s:label>IP&nbsp;Address</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the interface IP Address, format: dotted quad. eg. 192.168.0.100"
      alt="Set the interface IP Address, format: dotted quad. eg. 192.168.0.100" />
</td>
<td>
	<s:textfield name="ipAddr0" label="IP Address" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>Netmask</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the interface Netmask, format: dotted quad. eg. 255.255.255.0"
      alt="Set the interface Netmask, format: dotted quad. eg. 255.255.255.0" />
</td>
<td>
	<s:textfield name="netmask0" label="Netmask" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>Gateway</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the interface Gateway IP Address, format dotted quad. eg. 192.168.0.1"
      alt="Set the interface Gateway IP Address, format dotted quad. eg. 192.168.0.1" />
</td>
<td>
	<s:textfield name="gateway0" label="Gateway" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>DNS1</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the IP Address of the primary DNS server, format dotted quad. eg. 192.168.0.11"
      alt="Set the IP Address of the primary DNS server, format dotted quad. eg. 192.168.0.11" />
</td>
<td>
	<s:textfield name="dns1" label="DNS1" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>DNS2</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the IP Address of the secondary DNS server, format dotted quad. eg. 192.168.0.12"
      alt="Set the IP Address of the secondary DNS server, format dotted quad. eg. 192.168.0.12" />
</td>
<td>
	<s:textfield name="dns2" label="DNS2" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>DNS3</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the IP Address of the tertiary DNS server, format dotted quad. eg. 192.168.0.13"
      alt="Set the IP Address of the tertiary DNS server, format dotted quad. eg. 192.168.0.13" />
</td>
<td>
	<s:textfield name="dns3" label="DNS3" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
  <s:label>Domain</s:label>
  <img src='struts/tooltip.gif'
	  title="Set the Domain name. eg. communitysqueeze.org"
      alt="Set the Domain name. eg. communitysqueeze.org" />
</td>
<td>
	<s:textfield name="domain" label="Domain" cssClass="size-300px" />
</td>
</tr>			
