<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<title><s:text name="index.title" /></title>
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
				<h2><s:text name="index.header" /></h2>
				<p class="copyright">Designed by the Squeeze Community, for the Squeeze Community</p>
			</td>
		</tr>
	</table>

	<hr />

<h4>Community Squeeze Operating System</h4>
<p>Based on the <s:a href="http://fedoraproject.org" target="blank_">Fedora</s:a> 
18 Linux distribution, Community Squeeze Operating System (CSOS) is the
default operating system for the Community Squeeze Player project.
</p>
<p>CSOS R3 (Release 3) image, 
<s:a href="/images/wandboard/CSOS/CSOS-Wandboard-Dual-R3-20130412-1.img.7z"
     target="blank_">CSOS-Wandboard-Dual-R3-20130412-1.img.7z</s:a>, for the 
Wandboard Dual.
</p>
<hr />

<h4>Community Squeeze Software Repository</h4>
<p>The Community Squeeze software <s:a href="/repo" target="blank_">
repository</s:a> contains the software we have packaged 
for the CSOS Wandboard <s:a href="/repo/18/armhfp" target="blank_">ARM</s:a> 
image, as well as software pre-packaged for Fedora 18, 
<s:a href="/repo/18/x86_64" target="blank_">x86_64</s:a> and 
<s:a href="/repo/18/i386" target="blank_">i686</s:a> architectures. 
The <s:a href="http://vortexbox.org" target="blank_">Vortexbox</s:a> 
distribution, (version 2.2, which is currently based on Fedora 16 
<s:a href="/repo/16/i386" target="blank_">i386</s:a>), is also 
supported by the repository.</p>
<!-- 
<p><s:a href="repo.jsp">How to use the software repository.</s:a></p>
-->
<p>NB. The ARM packages (armv7hnl) are optimised for ARM7 hard-float with 
<s:a href="http://www.arm.com/products/processors/technologies/neon.php"
     target="blank_">Neon</s:a> extensions and have been compiled with: 
</p>
<pre>-march=armv7-a -mfloat-abi=hard -mfpu=neon</pre>.
<p />
<hr />

	<!-- Footer -->
	<jsp:include page="Footer.jsp" />
</body>

</html>
