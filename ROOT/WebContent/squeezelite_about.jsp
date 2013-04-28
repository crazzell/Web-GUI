<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title><s:text name="squeezelite.title" /></title>
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
				<h2><s:text name="squeezelite.header" /></h2>
			</td>
		</tr>
	</table>

<hr />

<h3><s:text name="header.introduction" /></h3>

<p>Community Squeeze OS provides a Squeezebox compatible audio player on the Wandboard hardware. 
The player uses a software application known as Squeezelite which provides the audio output and connects 
to your local LMS server in the same way as other hardware and software players. Squeezelite itself 
does not have a user interface and you will normally not need to configure it other than to select 
the audio output device you wish to use. Audio playback is controlled via the LMS server web interface, 
the Jivelite HDMI User Interface, (which is also part of CSOS), or by using another control 
application, of which there are many available. eg. 
<s:a href="https://play.google.com/store/apps/details?id=com.logitech.squeezeboxremote" 
     target="blank_">Logitech Squeezebox Controller</s:a>, 
<s:a href="http://penguinlovesmusic.de/ipeng-the-iphone-skin-for-squeezecenter/" 
     target="blank_">iPeng</s:a>, 
or 
<s:a href="http://orangebikelabs.com/products/orangesqueeze/" 
     target="blank_">Orange Squeeze</s:a>.
</p>

<h4>Specifications</h4>
<ol>
<li>Analog playback using the Wandboard sgtl5000 analogue line output</li>
<li>Digital (SPDIF) playback using the Wandboad optical TOSLINK output [Note: 1]</li>
<li>HDMI audio playback using the Wandboard HDMI port to a TV/monitor/sound bar with HDMI input or via 
a HDMI splitter</li>
<li>USB DAC connected directly to the Wandboard USB host port for USB audio class 2 DAC's or  
via an external high speed hub for USB class 1 external DAC's</li>
<li>Build in decode of the following formats: flac, wav, aiff, mp3, ogg, aac</li>
<li>Decode of other formats supported by LMS using server based transcoding</li> 
<li>Support of sample rates from 32k to 384k without re-sampling on supported devices [Note: 2]</li>
<li>Support of other sampling rates using LMS server re-sampling</li>
<li>Gapless playback of all formats</li> 
<li>Replay gain</li> 
<li>Cross fade</li>
<li>Synchronisation with Squeezebox hardware players and other Squeezelite based players</li>
</ol>
<p>
[1] Note that current versions of the Wandboard hardware have a wiring error for the optical SPDIF 
  port and may not work with all DACs without this being rewired.
</p>
<p>
[2] Up to 48k using the TOSLINK output or 96k using the sgtl5000 analogue line out.
</p>
<hr />

<h3>Output Selection</h3>

<p>You will normally only need to configure Squeezelite to select which audio device to use as output. 
Squeezelite is started by default whenever CSOS is started and is normally controlled via the LMS server 
or other user interfaces to control a player. CSOS defaults to using the on-board Wandboard sgtl5000 
analogue line output for the output of Squeezelite. To change this you should use one of the two 
configuration interfaces to select alternative output devices:
</p>

<h4>Via the Jivelite HDMI User Interface</h4>

<p>Using the Jivelite HDMI User Interface navigate to: 
Settings&nbsp;&gt;&nbsp;Audio&nbsp;Settings&nbsp;&gt;&nbsp;Audio&nbsp;Output&nbsp;Device
Select the desired output device from the list and confirm by selecting the &quot;Select device&quot; 
option. The device should then be confirmed with a tick indicating that it is selected. Note that 
when selecting an external USB device the device must be powered on and connected to appear in the list.

<p>Output devices are:</p>
<ol>
<li>sgtl5000 - built-in analogue line output [*]</li>
<li>imxspdif - built-in optical TOSLINK digital output</li>
<li>imxhdmisoc - built-in HDMI port [*]</li>
</ol>
<p>[*] Note at present these two devices require specific additional Alsa parameter settings - see 
the advanced section, known configuration.</p>
<p>Other USB devices will also appear in this list with a name related to the USB DAC - select from 
these if you wish to use a usb device.</p>

<h4>Via the CSOS Web configuration interface</h4>

<p>Selecting &quot;Squeezelite Player&quot; from the CSOS Web Configuration interface provides a 
configuration page which allows the Squeezelite configuration parameters to be set. You should 
normally only need to change the Audio Device from this menu to change the output device. 
Select the desired output and then select &quot;Save&nbsp;and&nbsp;Conditionally&nbsp;Restart&quot;.
The same devices will appear in the drop down list on this page as for the Jivelite HDMI User Interface, 
but the name will also include &quot;hw:CARD=&quot; and &quot;plughw:CARD=&quot;. You should try the 
&quot;hw:&quot; version first and if this does not work reliably, then select the &quot;plughw:&quot; 
one.</p>

<p>Other parameters can also be set from this menu, these are explained in the advanced 
configuration.</p>

<hr />

<h3>Advanced Configuration</h3>

<p>Advanced configuration is normally only needed to turn the configuration for specific audio devices 
to enable better compatibility with certain devices. The CSOS Web Configuration interfaces provides 
access to all configuration options. The Jivelite HDMI User Interface provides access to the common 
additional options from the Settings &gt; Audio Settings &gt; Audio Output Device &gt; Optional Parameters 
(Advanced) menu.</p>

<p>Settings which you can adjust from both interfaces</p>

<h4>Alsa Parameters</h4>

<p>This defines the specific internal audio configuration used to interface to the device. It is made 
up of four separate parameters which are configured separately from the Jivelite HDMI User Interface 
and as one entry on the Web Configuration interface using the format 
&quot;&lt;a&gt;:&lt;b&gt;:&lt;c&gt;:&lt;d&gt;&quot;.</p>

<ol>
<li>Alsa Buffer Size - Size of the Alsa buffer in ms - you may need to increase this to 40 or 80 ms 
if you hear drop outs</li>
<li>Alsa Buffer Count - You are unlikely to need to increase this (change if you know what it does)</li>
<li>Alsa Format - Some devices may need this set to &quot;16&quot; to restrict audio output to 16 bits</li>
<li>Use MMAP - Some devices may need this set to &quot;0&quot; to avoid use of MMAP output</li>
</ol>

<h5>Know configurations</h5>

<ol>
<li>The sgtl5000 on-board audio device works best in 16 bit mode. 
By default, the Jivelite HDMI User Interface will set Alsa Format to &quot;16&quot; for this device.
By default, the Web Configuration interface with set the Alsa parameters to &quot;40::16:&quot;, if 
they are not user set. (ie. the field is left blank and not populated by the user.)
</li>
<li>The HDMI audio output does not work with MMAP after 50 minutes of playback, so set Use Alsa MMAP 
to &quot;0&quot; on the HDMI interface or &quot;:::0&quot; for the Alsa parameters on the web interface. 
By default, the Web Configuration interface with set the Alsa parameters to &quot;:::0&quot;, if 
they are not user set and the HDMI device is the chosen output device. 
(ie. the field is left blank and not populated by the user.)
</li>
</ol>

<h4>Max Sample Rate</h4>

<p>This defines the maximum sample rate supported by an audio device. There is no need to set this 
for built in devices or for DAC's which are permanently connected to the CSOS player as this will be 
automatically detected at power on. However for USB DAC's which may be powered off when you start up 
the player, setting this allows the player to know your DAC's capabilities.</p>

<h5>Settings only available from the Web Configuration interface</h5>

<ol>
<li>Name - Enables the name of your player to be set, this overrides the setting within LMS.</li>
<li>Server IP Address - This can be used to specify the address of your server if you have more than 
one server machine.</li>
</ol>

<p>Other settings enable tuning of the Squeezelite playback application, but are only normally 
required by experience users who wish to tweak their configuration. Please don't adjust unless 
you know what these do.</p>
<hr />

<h3>Source Code</h3>
<p>Squeezelite was written by, and is Copyright &copy; 2012, 2013 Adrian Smith.</p>
<p>Squeezelite source code is hosted by Google Code. 
<s:a href="http://code.google.com/p/squeezelite/" target="blank_">
Squeezelite Git Source Repository</s:a>.
</p>
<hr />

<h3><s:text name="header.author" /></h3>
<p>This information on this page was authored by 
<s:a href="http://forums.slimdevices.com/member.php?17-Triode" 
     target="blank_">Triode</s:a>, with minor contributions from 
<s:a href="http://forums.slimdevices.com/member.php?3069-JackOfAll" 
     target="blank_">JackOfAll</s:a>.</p>

<hr />
<jsp:include page="Footer.jsp" />

</body>
</html>