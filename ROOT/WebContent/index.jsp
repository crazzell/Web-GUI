<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title><s:text name="web.index.title" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="html/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="favicon.ico" rel="icon" type="image/x-icon" />
	<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>

<body>

	<!-- Header -->
	<jsp:include page="Header.jsp" />
	
	<table>
		<tr>
			<td>
				<s:a href="index.jsp">
				<img src="html/images/cs-logo-146x50.png" 
					 alt="Community Squeeze Logo" 
					 width="146" height="50" />
				</s:a>
			</td>
			<td>
				<h2><s:text name="web.index.header" /></h2>
				<p class="copyright">Designed by the Squeeze Community, for the Squeeze Community</p>
			</td>
		</tr>
	</table>

	<hr />

<h4>Community Squeeze OS</h4>
<p>Based on the Fedora Linux distribution, Community Squeeze OS is the
default operating system for the Community Squeeze Player.
</p>
<hr />

<h4>Software Repository</h4>
<p>The <s:a href="/repo" target="blank_">
repository</s:a> contains packages for the 
<s:a href="/repo/18/armhfp" target="blank_">ARM</s:a> 
platform, (compiled for ARM7 hard-float with Neon extensions), 
<s:a href="/repo/18/x86_64" target="blank_">x86_64</s:a> 
and <s:a href="/repo/18/i386" target="blank_">i686</s:a>.
</p>
<hr />

<h4>Current CSOS Install Image</h4>
<p>Community Squeeze OS R3 (Release 3) image, 
<s:a href="/images/wandboard/CSOS/CSOS-Wandboard-Dual-R3-20130412-1.img.7z"
     target="blank_">CSOS-Wandboard-Dual-R3-20130412-1.img.7z</s:a>, for the 
Wandboard Dual.
</p>
<hr />	

	<!-- Footer -->
	<jsp:include page="Footer.jsp" />
</body>

</html>
