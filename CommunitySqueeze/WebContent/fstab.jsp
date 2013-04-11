<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title>Community Squeeze OS: File Systems</title>
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
      <h2>File Systems</h2>
    </td>
  </tr>
</table>

<hr />
<h4>Mounted File Systems</h4>
<s:form action="Fstab" theme="simple">
<table>
<tr>
<td>
	<s:checkbox name="cbAll" label="All Filesystem Types" />
	<s:label>All Filesystem Types</s:label>
	<s:checkbox name="cbCifs" label="cifs" />
	<s:label>cifs</s:label>
	<s:checkbox name="cbExt4" label="ext4" />
	<s:label>ext4</s:label>
	<s:checkbox name="cbExt3" label="ext3" />
	<s:label>ext3</s:label>
	<s:checkbox name="cbExt2" label="ext2" />
	<s:label>ext2</s:label>
	<s:checkbox name="cbNfs" label="nfs" />
	<s:label>nfs</s:label>
</td>
</tr>
<tr>
<td>
	<s:textarea name="status" cols="100" rows="6" readonly="true" />
</td>
</tr>
<tr>
<td align="right">
	<s:submit action="Fstab_populate" value="Refresh" />
</td>
</tr>
</table>
</s:form>
<hr />
<h4>Fstab: Add</h4>
<a href="fstabAdd.jsp">Add a new entry to /etc/fstab</a>

<hr />
<h4>Fstab: Modify</h4>
<s:actionerror />
<s:form action="FstabSave_save" theme="simple">

<s:hidden name="status" />

<table>
<thead>
<tr>
<td>Specification</td>
<td>Mount Point</td>
<td>Type</td>
<td>Mount Options</td>
<td>Freq</td>
<td>Pass</td>
<td>Action</td>
<td>Delete</td>
</tr>
</thead>
<s:iterator value="fstabList" id="fstabList">
<tr>
<td><s:textfield name="spec" /></td>
<td><s:textfield name="file" /></td>
<td><s:textfield name="vfsType" cssClass="size-50px" /></td>
<td><s:textfield name="mntOps" /></td>
<td><s:textfield name="freq" cssClass="size-50px" /></td>
<td><s:textfield name="passNo" cssClass="size-50px" /></td>
<td><s:select name="action" list="fstabEntryActionList" /></td>
<td><s:checkbox name="delete" /></td>
</tr>
</s:iterator>
<tr>
<td colspan="8" align="left">
	<s:submit action="Fstab_populate" value="Refresh" />
	<s:submit action="FstabSave_save" value="Submit" />
	<s:reset />
</td>
</tr>
</table>
</s:form>
<hr />
<h4>Notes</h4>
<p>This configuration page is for viewing the mounted file systems and modifying /etc/fstab.</p>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
