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

<p>
<img src="html/images/jivelite/jivelite_1_640x427.png" 
     alt="Jivelite on monitor" width="640" height="427" />
</p>
<p>Jivelite is the Community Squeeze Operating System's recommended
graphical user interface. It is already installed and running by
default on CSOS enabled devices, but it is up to the user to decide
whether to connect a display and make use of it or not. Jivelite bears
a strong family resemblance to the user interfaces enabled by
Logitech's Jive framework, which formed the basis of the UI for the
Duet Controller, Radio and Touch devices. Users of those products
should feel right at home! New users will also appreciate the
uncluttered and intuitive user interface.</p>
<hr />

<h3>Connecting a Screen</h3>
<p>To use Jivelite on a Wandboard you will need to connect a suitable high-resolution display to 
the HDMI port on your device. At present, the available HD skins support a selection of common
resolutions:</p>
<ul>
<li>HDSkin-1080 (for 1920x1080 monitors, or 1080p TV's)</li>
<li>HDSkin­‐720 (for 1280x720 monitors, or 720p TV's)</li>
<li>HDSkin‐1280x1024 (for 1280x1024 monitors)</li>
</ul>
<p>For monitors that only provide DVI-D inputs, DVI-to-HDMI cables and adapters are widely
available.</p>
<hr />

<h3>Connecting an Input Device</h3>
<p>To navigate the Jivelite screens and menus you will need an input device with physical keys, 
eg. a infra-red (IR) remote control or a computer keyboard. There is no official touch screen
hardware at present. A good solution for IR remote control support is to purchase a 
<s:a href="http://flirc.tv" target="blank_">FLIRC</s:a> from one of the distributors. Wired or 
wireless USB keyboards can also be used, although a full-sized QUERTY keyboard is not ideal for 
living room use.</p>
<hr />

<h3>FLIRC Configuration File</h3>

<p><s:a href="config/CommunitySqueeze_Flirc_Configuration.fcfg">
Community Squeeze FLIRC configuration file</s:a> 
to use with FLIRC and a Squeezebox IR remote control.</p>
<hr />

<h3>Plugging and Playing</h3>
<p>Once you have connected a TV or monitor to the HDMI port, a USB
keyed input device of some kind and an Ethernet connection you are
nearly ready apply DC power to boot the device. First, make sure the
TV or monitor input selection menu is switched to the input port you
will be using (eg. HDMI 1, if that is the input you've connected to
the Wandboard.) Once you apply power, you will need to wait 30 seconds
to 1 minute before anything happens. The first sign of life should be
the Community Squeeze Operating System Logo for a few seconds and then
the following language selection screen should appear.</p>

<p>
<img src="html/images/jivelite/jivelite_2_640x480.png" 
     alt="Jivelite: Language Selection" width="640" height="480" />
</p>

<p>Now is a good time to check that the up and down arrow
buttons on your keyboard are working. Once you have the desired
language selected, press the right arrow button to move on.</p>

<p>You will next be presented with the Select Skin menu (see below).</p>

<p>
<img src="html/images/jivelite/jivelite_3_640x480.png" 
     alt="Jivelite: Skin Selection" width="640" height="480" />
</p>

<p>You should choose the skin with the maximum resolution supported by
your monitor or TV. Modern 1080p TV's should work with the HD 1920x1080 skin. 
Use the up and down keys to select your best available resolution and press the 
right arrow once you have highlighted your choice.
</p>

<p>
<img src="html/images/jivelite/jivelite_4_640x512.png" 
     alt="Jivelite: Confirm Skin Change" width="640" height="512" />
</p>

<p>The above screen requires you to confirm your selection in case the resolution before a 
timer expires.</p>

<p>If the screen goes completely blank, it means that have chosen a
resolution that your TV monitor doesn’t support. Just wait for 30
seconds or so, and it should revert to your previously working
resolution, allowing you to try another option.</p>

<p>If all goes well, you will see the Confirm Skin Change Screen as
shown above, and you will be able to press the down arrow and
right arrow to confirm before the timer expires. If so, you will be
automatically moved on to the Select Player menu.</p>

<p>
<img src="html/images/jivelite/jivelite_5_640x512.png" 
     alt="Jivelite: Choose Player" width="640" height="512" />
</p>

<p>The choose player menu will allow you to select among the Squeezebox compatible players on your 
home network. In this case, we want to select the local Squeezelite player on our Wandboard (pictured
above).</p>

<p>That completes initial setup. You now have Jivelite speaking your
language, making best use of your monitor resolution, and controlling
the local Squeezelite player on your Wandboard. Time to press the Home
key (ie. the lower case letter &quot;h&quot; if using a standard USB keyboard
or &quot;House&quot; icon on a dedicated Squeezebox IR remote).</p>

<p>You should now see a screen like the following.</p>

<p>
<img src="html/images/jivelite/jivelite_6_640x512.png" 
     alt="Jivelite: Main Menu" width="640" height="512" />
</p>

<p>Now would be a good time to play some music. Assuming you already have a Logitech Media Server 
set up, you should be able to browse your music library from the &quot;My&nbsp;Music&quot; menu 
screen to select and then play some music. This will bring you to the Now Playing screen,
illustrated below.</p>

<p>
<img src="html/images/jivelite/jivelite_7_640x512.png" 
     alt="Jivelite: Now Playing" width="640" height="512" />
</p>

<p>Welcome to joys of high-resolution album art on the now playing screen!</p>

<p>If you are controlling Jivelite with a QUERTY keyboard, you may find it useful to know some of 
the keystrokes shown below.</p>

<pre>

Go                  RIGHT, RETURN
Back                LEFT, ESC, BACKSPACE
Scroll up           UP
Scroll down         DOWN
Home                h, HOME
Up                  i
Down                k
Left                j
Right               l
Play                x, p
Play (hold)         P
Play next           W
Pause               c space
Add                 a, (Keypad +)
Add (hold)          A
Rew                 z, &lt;
Rew (hold)          Z
Fwd                 b, &gt;
Fwd (hold)          B
Volume up           +, =
Volume down         -
Screenshot          S
Disconnect Player   D
Search              /

--Temporary/In progress:

[                   Now Playing
]                   Now Playing Playlist
,                   Shuffle Toggle
.                   Repeat Toggle
;                   Music Library
:                   Favorites

Play Favorite 0-9 0-9
</pre>

<hr />

<h3>Pictures</h3>

<img src="html/images/jivelite/squeezeplay0001_640x480.png" 
     alt="Jivelite: Choose Language (640x480)"
     width="640" height="480" />
<p />
<p class="copyright">&quot;Choose&nbsp;Language&quot;, using HD Skin (640x480). 
Contributed by Triode.</p>
<br />
<br />

<img src="html/images/jivelite/squeezeplay0002_640x480.png" 
     alt="Jivelite: Select Skin (640x480)"
     width="640" height="480" />
<p />
<p class="copyright">&quot;Select&nbsp;Skin&quot;, using HD Skin (640x480). 
Contributed by Triode.</p>
<br />
<br />

<s:a href="html/images/jivelite/squeezeplay0005_1280x720.png" target="blank_">
<img src="html/images/jivelite/squeezeplay0005_640x360.png" 
     alt="Jivelite: Select Skin (1280x720)"
     width="640" height="360" />
</s:a>
<p />
<p class="copyright">&quot;Select&nbsp;Skin&quot;, using HD Skin (1280x720). 
Contributed by Triode.</p>
<br />
<br />

<s:a href="html/images/jivelite/squeezeplay0006_1280x720.png" target="blank_">
<img src="html/images/jivelite/squeezeplay0006_640x360.png" 
     alt="Jivelite: Confirm Skin Change (1280x720)"
     width="640" height="360" />
</s:a>
<p />
<p class="copyright">&quot;Confirm&nbsp;Skin&nbsp;Change&quot;, using HD Skin (1280x720). 
Contributed by Triode.</p>
<br />
<br />

<s:a href="html/images/jivelite/squeezeplay0007_1280x720.png" target="blank_">
<img src="html/images/jivelite/squeezeplay0007_640x360.png" 
     alt="Jivelite: Main Menu (1280x720)"
     width="640" height="360" />
</s:a>
<p />
<p class="copyright">&quot;Main&nbsp;Menu&quot;, using HD Skin (1280x720). 
Contributed by Triode.</p>
<br />
<br />

<s:a href="html/images/jivelite/squeezeplay0008_1280x720.png" target="blank_">
<img src="html/images/jivelite/squeezeplay0008_640x360.png" 
     alt="Jivelite: My Music (1280x720)"
     width="640" height="360" />
</s:a>
<p />
<p class="copyright">&quot;Main&nbsp;Menu&nbsp;&minus;&gt;&nbsp;My&nbsp;Music&quot;, using HD Skin (1280x720). 
Contributed by Triode.</p>
<br />
<br />

<s:a href="html/images/jivelite/squeezeplay0009_1280x720.png" target="blank_">
<img src="html/images/jivelite/squeezeplay0009_640x360.png" 
     alt="Jivelite: Spotify What's New (1280x720)"
     width="640" height="360" />
</s:a>
<p />
<p class="copyright">&quot;Main&nbsp;Menu&nbsp;&minus;&gt;&nbsp;My&nbsp;Apps&nbsp;&minus;&gt;&nbsp;Spotify&nbsp;&minus;&gt;&nbsp;What's&nbsp;New&quot;, using HD Skin (1280x720). 
Contributed by Triode.</p>
<br />
<br />

<s:a href="html/images/jivelite/squeezeplay0013_1280x720.png" target="blank_">
<img src="html/images/jivelite/squeezeplay0013_640x360.png" 
     alt="Jivelite: Now Playing (1280x720)"
     width="640" height="360" />
</s:a>
<p />
<p class="copyright">&quot;Now&nbsp;Playing&quot;, using HD Skin (1280x720). 
Contributed by Triode.</p>
<br />
<br />

<img src="html/images/jivelite/jivelite_now_playing.png" 
     alt="Jivelite: Now Playing" 
     width="482" height="274" />
<p />
<p class="copyright">&quot;Now&nbsp;Playing&quot;, using WQVGA Small Print Skin. 
Contributed by JackOfAll</p>
<br />
<br />

<img src="html/images/jivelite/jivelite_main_menu.png" 
     alt="Jivelite: Main Menu" 
     width="482" height="274" />
<p />
<p class="copyright">&quot;Main&nbsp;Menu&quot;, using WQVGA Small Print Skin.
Contributed by JackOfAll.</p>
<br />
<br />

<img src="html/images/jivelite/jivelite_choose_player.png" 
     alt="Jivelite: Choose Player" 
     width="482" height="274" />
<p />
<p class="copyright">&quot;Choose&nbsp;Player&quot;, using WQVGA Small Print Skin.
Contributed by JackOfAll.</p>
<br />
<br />

<img src="html/images/jivelite/jivelite_spotify_what_s_new.png" 
     alt="Jivelite: Spotify What's New" 
     width="482" height="274" />
<p />
<p class="copyright">&quot;Main&nbsp;Menu&nbsp;&minus;&gt;&nbsp;My&nbsp;Apps&nbsp;&minus;&gt;&nbsp;Spotify&nbsp;&minus;&gt;&nbsp;What's&nbsp;New&quot;, using WQVGA Small Print Skin.
Contributed by JackOfAll.</p>
<br />
<br />
 
<hr />

<h3>Source Code</h3>
<p>Jivelite is maintained by Adrian Smith.</p>
<p>Jivelite source code is hosted by Google Code. 
<s:a href="http://code.google.com/p/jivelite/" target="blank_">
Jivelite Git Source Repository</s:a>.
</p>
<hr />

<h3><s:text name="header.author" /></h3>
<p>This information on this page was authored by
<s:a href="http://forums.slimdevices.com/member.php?12588-dsdreamer" 
     target="blank_">dsdreamer</s:a>, with screen shot contributions from  
<s:a href="http://forums.slimdevices.com/member.php?17-Triode" 
     target="blank_">Triode</s:a> and 
<s:a href="http://forums.slimdevices.com/member.php?3069-JackOfAll" 
     target="blank_">JackOfAll</s:a>.</p>


<hr />
<jsp:include page="Footer.jsp" />

</body>
</html>