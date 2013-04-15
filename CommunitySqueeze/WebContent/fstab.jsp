<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <title><s:text name="fstab.title" /></title>
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
      <h2><s:text name="fstab.header" /></h2>
    </td>
  </tr>
</table>

<hr />
<h4><s:text name="header.mountedFileSystems" /></h4>
<s:form action="Fstab" theme="simple">
<table>
<tr>
<td>
	<s:checkbox name="cbAll" />
	<s:text name="cb.allFileSystemTypes" />
	<s:checkbox name="cbCifs" />
	<s:text name="cb.cifs" />
	<s:checkbox name="cbExt4" />
	<s:text name="cb.ext4" />
	<s:checkbox name="cbExt3" />
	<s:text name="cb.ext3" />
	<s:checkbox name="cbExt2" />
	<s:text name="cb.ext2" />
	<s:checkbox name="cbNfs" />
	<s:text name="cb.nfs" />
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
<h4><s:text name="header.fstabAdd" /></h4>
<a href="<s:url  action="FstabAdd.action" />">
  <s:text name="fstab.addEntry.message" />
</a>

<hr />
<h4><s:text name="header.fstabModify" /></h4>
<s:actionerror />
<s:form action="FstabSave_save" theme="simple">

<s:hidden name="status" />

<table>
<thead>
<tr>
<td><s:text name="fstab.label.spec" /></td>
<td><s:text name="fstab.label.file" /></td>
<td><s:text name="fstab.label.vfsType" /></td>
<td><s:text name="fstab.label.mntOps" /></td>
<td><s:text name="fstab.label.freq" /></td>
<td><s:text name="fstab.label.passNo" /></td>
<td><s:text name="fstab.label.action" /></td>
<td><s:text name="fstab.label.delete" /></td>
</tr>
</thead>
<s:iterator value="fstabList" id="fstabList">
<tr>
<td><s:textfield name="spec" readonly="true" /></td>
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
	<s:submit action="Fstab_populate" key="button.refresh" />
	<s:submit action="FstabSave_save" key="button.submit" />
	<s:reset />
</td>
</tr>
</table>
</s:form>
<hr />
<h4><s:text name="header.notes" /></h4>
<p><s:text name="fstab.notes.desc" /></p>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
