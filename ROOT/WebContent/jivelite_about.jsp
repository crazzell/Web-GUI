<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title><s:text name="jivelite.title" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link href="html/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="favicon.ico" rel="icon" type="image/x-icon" />
  <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>

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
				<h2><s:text name="jivelite.header" /></h2>
			</td>
		</tr>
	</table>

<hr />

<h3><s:text name="header.introduction" /></h3>

<p>Anyone familiar with the Logitech Jive software application, which is used on the Logitech Touch, will 
instantly recognise the Jivelite software application, used on the Wandboard.
</p>
<hr />

<h3>FLIRC Configuration File</h3>

<p><s:a href="config/CommunitySqueeze_Flirc_Configuration.fcfg">
Community Squeeze FLIRC configuration file</s:a> 
to use with FLIRC and a Squeezebox IR remote control.</p>
<hr />

<h3>Pictures</h3>

<img alt="Jivelite: Now Playing" src="html/images/jivelite/jivelite_now_playing.png"
     width="482" height="274" />
<p>Jivelite: Now Playing</p>
<br />

<img alt="Jivelite: Main Menu" src="html/images/jivelite/jivelite_main_menu.png"
     width="482" height="274" />
<p>Jivelite: Main menu</p>
<br />

<img alt="Jivelite: Choose Player" src="html/images/jivelite/jivelite_choose_player.png"
     width="482" height="274" />
<p>Jivelite: Choose Player</p>
<br />

<img alt="Jivelite: Spotify What's New" src="html/images/jivelite/jivelite_spotify_what_s_new.png"
     width="482" height="274" />
<p>Jivelite: Spotify What's New</p>

<hr />

<h3><s:text name="header.author" /></h3>
<p>TBD</p>

<hr />
<jsp:include page="Footer.jsp" />

</body>
</html>