<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title><s:text name="faq.title" /></title>
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
				<s:a action="Index">
				<img src="html/images/cs-logo-146x50.png" 
					 alt="Community Squeeze Logo" 
					 width="146" height="50" />
				</s:a>
			</td>
			<td>
				<h2><s:text name="faq.header" /></h2>
			</td>
		</tr>
	</table>

	<hr />
	<h3><s:text name="header.faq" /> (0.91.CM)</h3>

<h5>What is Community Squeeze?</h5>
<p>It's a project to produce an audiophile quality Squeezebox compatible music player by various 
community members, running open source software.</p>
 
<h5>What hardware does it use?</h5> 
<p>A <s:a href="http://www.wandboard.org" target="blank_">Wandboard</s:a> Dual Lite CPU card 
attached to a custom audio carrier designed by John Swenson.
</p> 
 
<h5>What Software does it run?</h5> 
<p>A Linux software distribution (based on 
<s:a href="http://fedoraproject.org" target="blank_">Fedora</s:a> 18 ARM), featuring Squeezelite 
(software player) and JiveLite (software controller). 
</p>
<p>Logitech Media Server (LMS) 7.8 is installed, so the device can be configured as a 
server as well as a client. 
</p> 
<p>This operating system is called <b>Community Squeeze Operating System (CSOS)</b>. 
The current CSOS software image can be downloaded from the 
<s:a href="http://www.communitysqueeze.org" target="blank_">Community Squeeze</s:a> 
web site.
</p> 
 
<h5>Who are the main contributors?</h5>
<ul>
<li>Triode (Software development: Squeezelite software player, Jivelite software controller)</li> 
<li>JackOfAll (CSOS packaging and build, Web Configuration GUI development)</li> 
<li>JohnSwenson (Hardware design)</li>
</ul>
<p />
<p>Several other members of the community have contributed language translations and documentation.
</p>
<p />
<ul>
<li>ChunkyWizard (FAQ)</li>
<li>albertone74 (Italian Translation)</li>
<li>Translation: ...</li>
<li>Translation: ...</li>
<li>Translation: ...</li>
<li>Translation: ...</li>
</ul>
<p />
 
<h5>What audio interfaces are going to be supported?</h5> 
<ul>
<li>SPDIF: electrical (COAX BNC)</li>
<li>SPDIF: optical (TOSLINK)</li>
<li>USB: UAC1 and UAC2</li>
<li>Line Level Analogue: single-ended (RCA), balanced (XLR) and headphones.</li>
</ul>
<p />
 
<h5>What is the on board DAC?</h5> 
<p><s:a href="http://www.ti.com/product/pcm5142" target="blank_">TI PCM5142</s:a>
</p>
 
<h5>Which external DACs have been tested with the Wandboard?</h5> 
<p>SlimDevices forum post with list of
<s:a href="http://forums.slimdevices.com/showthread.php?98544‐Community‐Squeeze‐OS‐R3&p=744486&viewfull=1#post744486"
     target="blank_">compatible USB DAC's</s:a> by JackOfAll.
</p> 
 
<h5>What do you need to get started with CSOS ahead of a finished product?</h5> 
<p>Required:</p>
<ul>
<li><s:a href="http://www.wandboard.org" target="blank_">Wandboard</s:a> Dual</li> 
<li>5V (&gt;= 2A) Power Supply</li> 
<li>MicroSD card (&gt;= 4GB capacity)</li>
</ul>
<p />
<p>Optional:</p>
<ul> 
<li>Wandboard case</li> 
<li>Wandboard wi-fi antenna</li> 
<li>1080p TV or monitor with HDMI input</li> 
<li>FLIRC IR receiver and IR remote</li> 
<li>USB keyboard</li>
</ul>
<p />
<p>NB. You will also require a USB hub if you wish to use more than one USB peripheral at a time. eg. 
to connect a FLIRC USB dongle and an external USB DAC.
</p> 
 
<h5>Is there a bug list?</h5> 
<p>Initial feedback is via the 
<s:a href="http://forums.slimdevices.com/showthread.php?98544-Community-Squeeze-OS-R3" 
     target="blank_">Community Squeeze OS R3</s:a> thread in the SlimDevices Linux forum. 
We can probably start using a github issues list, though some of the code 
(Squeezelite / Jivelite) is hosted on googlecode and already has issue management via that.</p> 
 
<h5>Where can you buy a Wandboard?</h5> 
<p><s:a href="http://wandboard.org/index.php/buy"
        target="blank_">How to get a Wandboard</s:a></p>
 
<h5>What's the audio hardware?</h5> 
<p>There are going to be (at least) 3 versions of the audio carrier card that brings out audio 
specific functionality: SWAMP0.5, CSP1 and CSP2</p> 
 
<h5>What's SWAMP0.5?</h5> 
<p>SWAMP0.5 is the first prototype board to test the concept. It is not available to buy. It 
measures 4.3&quot; x 3.6&quot; and is populated with a DAC chip, TOSLINK, 2 USB jacks (one for host 
only and one for OTG), ethernet, and a serial port. 
<s:a href="http://forums.slimdevices.com/attachment.php?attachmentid=14586&d=1362968470"
     target="blank_">SWAMP0.5 PCB layout</s:a>
</p> 
 
<h5>What's CSP1?</h5> 
<p>CSP1 will be a beta version of the hardware carrier card. The user will be required to provide 
a Wandboard module, unscrew 4 screws and install it on the carrier board.</p>
<p>The specification (subject to change) for CSP1 is:</p> 
<ul>
<li>6.3&quot; x 6.3&quot;</li> 
<li>Hammond 1455T1601 case</li> 
<li>Extruded aluminium with PCB slots designed for 6.3&quot; boards</li> 
<li>Separate screwed on end plates</li> 
<li>Connectors on one side of the board (the back) and stick through holes on the custom 
end plate.</li> 
<li>The front end plate has nothing on it, so it can be whatever you want, use the one that 
comes with the case or be creative.</li> 
</ul>
<p /> 
<p>Connections (starting from the right side, working left are):</p>
<ul> 
<li>top: barrel power jack, bottom: micro USB as power connector</li> 
<li>top: RJ‐45 Ethernet jack, no bottom</li> 
<li>top: micro OTG USB jack, bottom: HDMI jack</li> 
<li>top: stacked USB full size type A jacks (host jacks, type on laptops etc), no bottom</li> 
<li>top: BNC jack (SPDIF), bottom: TOSLINK</li> 
<li>top: 3.5mm headphone jack, no bottom</li> 
<li>top: 2 RCA jacks side by side, bottom: 2 XLR jacks side by side</li> 
</ul>
<p />
 
<h5>Can you reorder the jacks?</h5> 
<p>John can't really re‐arrange the order of the jacks; it's determined by the pin order on that 
giant connector. If he changed the order he would have high speed differential signals 
crossing each other, and he doesn't want to do that.</p> 
 
<h5>Is there going to be a status LED?</h5> 
<p>There will be nothing on the front panel, just a green power LED on the back (directly across 
the incoming power feed)</p> 
 
<h5>Will there be balanced outputs on CSP1?</h5> 
<p>Yes, but the balanced outputs will take some software work to get running. Most likely this 
will not be ready when the CSP1 board is first released, so don't expect to hook up the 
balanced outputs at first. (Well you can hook them up, you will just get silence!)</p> 
 
<h5>Is there anything on the front panel in CSP1?</h5> 
<p>No, there is nothing on the front panel.</p> 
 
<h5>Are there any hooks for experimenters?</h5> 
<p>Most likely there will be some headers on the board with an SPI and I2C and a couple of GPIO's 
for people who really want to experiment, but these will not be guaranteed to be exactly the 
same on subsequent boards. They will not have external connectors. Use at your own risk.</p>
 
<h5>Will there be a user interface on CSP1?</h5> 
<p>Whilst there isn't a built in display, Jivelite can be used to control the player using an 
external TV or monitor via the HDMI port.</p> 
 
<h5>How can you control CSP1?</h5> 
<p>The traditional SB control options will all work (server web UI, external programs on smart 
phones, tablets, laptops, desktops, the Duet controller, a SB Touch, etc.) There will also be some 
form of HDMI output and IR input which can be used for control. There will be a built‐in web 
server for configuration purposes.</p> 
 
<h5>How many CSP1's will be made?</h5> 
<p>An estimated 25 units will be fabricated.</p> 
 
<h5>What's after CSP1?</h5> 
<p>CSP2 will be the general release version. It is expected that there will be at least 2 distributors, 
one in Europe and the other in the USA. 
It is hoped (but to be confirmed) that there will be the option of purchasing the bare DAC carrier board, 
or a ready to go, pre‐built player, assembled, tested and comprising the DAC carrier board, 
Wandboard Dual CPU board, Hammond extruded aluminium chassis, front/rear panels, (glass fibre PCB 
material), a power supply, and a pre‐imaged SD card.</p> 
 
<h5>Is CSP1/CSP2 going to include IR receivers/blasters?</h5> 
<p>No, IR devices will be supported by third-party modules. eg. 
<s:a href="http://flirc.tv" target="blank_">FLIRC</s:a>.
</p> 

<h5>Is it possible to have audio on SPDIF and analog at the same time?</h5> 
<p>All outputs can physically be on at the same time, whether they can in actuality is a matter 
of software. Currently Squeezelite doesn't support more than one output, but it can 
certainly be done using the ALSA duplication technique used in the Touch.</p> 
 
<h5>Will CSP1 come with trigger outputs?</h5> 
<p>The CSP1 board will not have dedicated control outputs. They can easily be added using USB. 
By using USB you can get exactly what you want with drivers that already exist. There are 
literally hundreds of USB to control boxes out there at very inexpensive price points that can 
cover just about anything anybody may want.</p>
 
<h5>What about CSP2?</h5> 
<p>The complement of IO's on CSP2 has not been decided. John's personal preference is to not 
put dedicated connectors on the player for things that can easily be done with USB. This will 
keep down the connector count on the back panel</p> 
 
<h5>What is the PSU for CSP1?</h5> 
<p>The power supply used for a Wandboard will be usable for CSP1. The Carrier card will also 
include a micro USB port as an (optional) power port. You can use either the barrel connector 
or the USB port for power (just not both at the same time). The barrel connector is 5.5mm x 2.1mm. 
Both 5.5mm x 2.1mm and 5.5mm x 2.5mm connectors can be used.</p> 
 
<h5>If you get a Wandboard now, can you re-use its CPU card for later releases?</h5> 
<p>Maybe, but at the present time we don't know yet whether we will be releasing the later products 
without CPU modules.</p> 
 
<h5>How can I be a beta tester for CSP1?</h5> 
<p>There is no official beta group yet, no official &quot;list&quot;. When CSP1 is getting closer 
to being available we will do that. So don't start trying to jockey for position in the list just yet, 
any such requests are going to be ignored at this point.</p>  
 
<h5>Will the CSOS be embedded on the board in Gen2?</h5> 
<p>No, it will still require that a OS software image is installed on a SD card.</p> 
 
<h5>Will WIFI be supported?</h5> 
<p>Yes, it will. The Wandboard Dual CPU module contains built-in wifi and Bluetooth via a 
Broadcom chipset.</p> 
 
<h5>How well will this player synchronise with existing Squeezeboxes?</h5> 
<p>Well, hopefully. It is Squeezelite based on a Linux OS and the discussions on the Squeezelite 
thread regarding sync on the Linux forum are relevant. It is not as good as a Squeezebox 
Touch at present, but there's scope for tuning the OS further to improve this. Fundamentally 
it's doing very similar things to the Touch, and with tuning of the software we hope this can 
be improved.</p> 
 
<h5>How easy is it to setup?</h5> 
<p>It's pretty easy. It will use the existing LMS server software and should behave like most 
Squeezeboxes. To configure wireless settings, such as entering a WIFI password, you'll plug it 
into your wired network. It will use DHCP to configure itself on the network, and then it will 
have a built‐in web interface for configuring WIFI.</p> 
 
<h5>How will you control it if it doesn't have a display?</h5> 
<p>It won't have a built‐in display, so you'll need some other way to control the player across 
the network. That could be a smartphone or tablet, but it doesn't have to be. It could be 
controlled through the web interface of LMS, or you could use your Touch (you can point the 
Touch's user interface at any Squeezebox player on your network).</p> 
 
<h5>Do you need to be familiar with Linux to get this all to work?</h5> 
<p>No, you just need to load the CSOS image to an SD card.</p> 

<h5>TOSLINK isn't working for me on the default Wandboard carrier board. What can be done?</h5>
<p>Slimdevices forum <s:a href="http://forums.slimdevices.com/showthread.php?97881‐Community‐Funded‐Squeezebox‐Replacement‐Would‐you‐be‐interested&p=745185&viewfull=1#post745185"
        target="blank_">TOSLINK</s:a> post by Terry.
</p>

	<hr />
	<jsp:include page="Footer.jsp" />
</body>
</html>
