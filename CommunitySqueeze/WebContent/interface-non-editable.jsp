<%@ taglib uri="/struts-tags" prefix="s" %>

<s:hidden name="status" />

<s:hidden name="name" />
<s:hidden name="type" />
<s:hidden name="uuid" />
<s:hidden name="hwAddr" />
<s:hidden name="zone" />
<s:hidden name="bootProto" />
<s:hidden name="onBoot" />

<tr>
<td align="right">Name</td>
<td><font color="blue"><s:property value="name" /></font></td>
</tr>
<tr>
<td align="right">Type</td>
<td><font color="blue"><s:property value="type" /></font></td>
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
