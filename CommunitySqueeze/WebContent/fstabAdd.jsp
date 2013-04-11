<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title>Community Squeeze OS: Add Fstab Entry</title>
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
        <img src="images/cs-logo-146x50.png" alt="Community Squeeze Logo" 
          width="146" height="50" />
      </a>
    </td>
    <td>
      <h2>Add Fstab Entry</h2>
    </td>
  </tr>
</table>

<hr />

<h4>Configuration</h4>
<s:actionerror />
<s:form action="FstabAdd" theme="simple" >
<table>
<tr>
<td align="right">
	<s:label>Specification</s:label>
	<img src='struts/tooltip.gif'
	  title="The block special device or remote filesystem to be mounted"
      alt="The block special device or remote filesystem to be mounted" />
</td>
<td>
	<s:textfield name="spec" cssClass="size-300px" />
</td>      
</tr>
<tr>
<td align="right">
    <s:label>Mount&nbsp;Point</s:label>
	<img src='struts/tooltip.gif'
	  title="The mount point for the filesystem. eg. /mnt"
      alt="The mount point for the filesystem. eg. /mnt" />
</td>
<td>
	<s:textfield name="file" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Type</s:label>
	<img src='struts/tooltip.gif'
	  title="The type of the filesystem. eg. nfs, cifs"
      alt="The type of the filesystem. eg. nfs, cifs" />
</td>
<td>
	<s:textfield name="vfsType" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Mount&nbsp;Options</s:label>
	<img src='struts/tooltip.gif'
	  title="The mount options associated with the filesystem. eg. defaults"
      alt="The mount options associated with the filesystem. eg. defaults" />
</td>
<td>
	<s:textfield name="mntOps" cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Frequency</s:label>
	<img src='struts/tooltip.gif'
	  title="Used by the dump command to determine which filesystems need to be dumped.
	         Usually &quot;0&quot;"
      alt="Used by the dump command to determine which filesystems need to be dumped.
           Usually &quot;0&quot;" />
</td>
<td>
	<s:textfield name="freq" cssClass="size-50px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Pass&nbsp;Number</s:label>
	<img src='struts/tooltip.gif'
	  title="Used by the fsck program to determine the order in which filesystem checks are done at reboot time.
	         Usually &quot;2&quot; for a local fs and &quot;0&quot; for a remote fs"
      alt="Used by the fsck program to determine the order in which filesystem checks are done at reboot time.
           Usually &quot;2&quot; for a local fs and &quot;0&quot; for a remote fs" />
</td>
<td>
	<s:textfield name="passNo" cssClass="size-50px" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:reset key="button.reset"/>
	<s:submit action="FstabAdd" value="Save" />
</td>
</tr>
</table>
			
</s:form>

<hr />
<h4>Notes</h4>
<p>This configuration page is for adding an entry to /etc/fstab.</p>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
