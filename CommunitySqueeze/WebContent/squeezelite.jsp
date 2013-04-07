<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <title>Community Squeeze OS: Squeezelite Player Configuration and Control</title>
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
      <h2>Squeezelite Player Configuration and Control</h2>
    </td>
  </tr>
</table>

<hr />
<h4>Service</h4>
<s:form action="Squeezelite_populate" theme="simple" >
<table>
<tr>
<td>
	<s:textarea name="status" cols="100" rows="4" readonly="true" />
</td>
</tr>
<tr>
<td align="right">
	<s:submit action="Squeezelite_populate" value="Refresh" />
	<s:submit action="Squeezelite_enableService" value="Enable" />
	<s:submit action="Squeezelite_disableService" value="Disable" />
	<s:submit action="Squeezelite_startService" value="Start" />
	<s:submit action="Squeezelite_stopService" value="Stop" />
	<s:submit action="Squeezelite_restartService" value="Restart" />
</td>
</tr>
<tr>
<td align="right">
	<s:submit action="Squeezelite_enableAndStartService" value="Enable and Start" />
	<s:submit action="Squeezelite_disableAndStopService" value="Disable and Stop" />
</td>
</tr>
</table>
</s:form>

<hr />
<h4>Configuration</h4>
<s:actionerror />
<s:form action="SqueezeliteSave_save" theme="simple" >
<table>
<tr>
<td align="right">
	<s:label>Name</s:label>
	<img src='struts/tooltip.gif'
	  title="Set the player name"
      alt="Set the player name" />
</td>
<td>
	<s:textfield name="name" label="Name" 
		tooltip="Set the player name" 
		cssClass="size-300px" />
</td>      
</tr>
<tr>
<td align="right">
    <s:label>MAC&nbsp;Address</s:label>
	<img src='struts/tooltip.gif'
	  title="Set mac address, format: ab:cd:ef:12:34:56"
      alt="Set mac address, format: ab:cd:ef:12:34:56" />
</td>
<td>
	<s:textfield name="mac" label="MAC Address" 
		tooltip="Set mac address, format: ab:cd:ef:12:34:56" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Audio&nbsp;Device</s:label>
	<img src='struts/tooltip.gif'
	  title="Specify output device, default 'default' if not specified"
      alt="Specify output device, default 'default' if not specified" />
</td>
<td>
	<s:select name="audioDev" list="audioDevList" label="Audio Device" 
		tooltip="Specify output device, default 'default' if not specified" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Max&nbsp;Sample&nbsp;Rate</s:label>
	<img src='struts/tooltip.gif'
	  title="Max sample rate for output device, enables output device to be off when squeezelite is started, format: <rate>"
      alt="Max sample rate for output device, enables output device to be off when squeezelite is started, format: <rate>" />
</td>
<td>
	<s:textfield name="maxRate" label="Max Sample Rate" 
		tooltip="Max sample rate for output device, enables output device to be off when squeezelite is started, format: <rate>" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Log&nbsp;File</s:label>
	<img src='struts/tooltip.gif'
	  title="Write debug to logfile, format: <logfile>"
      alt="Write debug to logfile, format: <logfile>" />
</td>
<td>
	<s:textfield name="logFile" label="Log File" 
		tooltip="Write debug to logfile, format: <logfile>" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Log&nbsp;Level</s:label>
	<img src='struts/tooltip.gif'
	  title="Set logging level, format: <log>=<level> [<log>=<level> <log>=<level> ...],
		 logs: all|slimproto|stream|decode|output, 
		 level: info|debug|sdebug"
      alt="Set logging level, format: <log>=<level> [<log>=<level> <log>=<level> ...],
		 logs: all|slimproto|stream|decode|output, 
		 level: info|debug|sdebug" />
</td>
<td>
	<s:textfield name="logLevel" label="Log Level" 
		tooltip="Set logging level, format: <log>=<level> [<log>=<level> <log>=<level> ...],
		 logs: all|slimproto|stream|decode|output, 
		 level: info|debug|sdebug" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>RT&nbsp;Thread&nbsp;Priority</s:label>
	<img src='struts/tooltip.gif'
	  title="Set real time priority of output thread"
      alt="Set real time priority of output thread" />
</td>
<td>
	<s:select name="priority" list="priorityList" label="RT Thread Priority" 
		tooltip="Set real time priority of output thread" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Buffer</s:label>
	<img src='struts/tooltip.gif'
	  title="Specify internal Stream and Output buffer sizes in Kbytes, format: <stream>:<output>"
      alt="Specify internal Stream and Output buffer sizes in Kbytes, format: <stream>:<output>" />
</td>
<td>
	<s:textfield name="buffer" label="Buffer" 
		tooltip="Specify internal Stream and Output buffer sizes in Kbytes, format: <stream>:<output>" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Codec</s:label>
	<img src='struts/tooltip.gif'
	  title="Restrict codecs those specified, otherwise loads all available codecs; 
		 format: <codec1>[,<codec2>,<codec3>,...]
		 known codecs: flac,pcm,mp3,ogg,aac (mad,mpg for specific mp3 codec)"
      alt="Restrict codecs those specified, otherwise loads all available codecs; 
		 format: <codec1>[,<codec2>,<codec3>,...]
		 known codecs: flac,pcm,mp3,ogg,aac (mad,mpg for specific mp3 codec)" />
</td>
<td>
	<s:textfield name="codec" label="Codec" 
		tooltip="Restrict codecs those specified, otherwise loads all available codecs; 
		 format: <codec1>[,<codec2>,<codec3>,...]
		 known codecs: flac,pcm,mp3,ogg,aac (mad,mpg for specific mp3 codec)" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Alsa&nbsp;Params</s:label>
	<img src='struts/tooltip.gif'
	  title="Specify ALSA params to open output device, format: <b>:<c>:<f>:<m>, 
		 b = buffer time in ms, 
		 c = period count, 
		 f = sample format (16|24|24_3|32), 
		 m = use mmap (0|1)"
      alt="Specify ALSA params to open output device, format: <b>:<c>:<f>:<m>, 
		 b = buffer time in ms, 
		 c = period count, 
		 f = sample format (16|24|24_3|32), 
		 m = use mmap (0|1)" />
</td>
<td>
	<s:textfield name="alsaParams" label="Alsa Params" 
		tooltip="Specify ALSA params to open output device, format: <b>:<c>:<f>:<m>, 
		 b = buffer time in ms, 
		 c = period count, 
		 f = sample format (16|24|24_3|32), 
		 m = use mmap (0|1)" 
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td align="right">
	<s:label>Server&nbsp;IP&nbsp;Address</s:label>
	<img src='struts/tooltip.gif'
	  title="Connect to specified server, otherwise uses autodiscovery to find server"
      alt="Connect to specified server, otherwise uses autodiscovery to find server" />
</td>
<td>
	<s:textfield name="serverIp" label="Server IP Address" 
		tooltip="Connect to specified server, otherwise uses autodiscovery to find server"
		cssClass="size-300px" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:reset key="button.reset"/>
	<s:submit action="SqueezeliteSave_save" value="Save" />
</td>
</tr>
<tr>
<td colspan="2" align="right">
	<s:submit action="SqueezeliteSave_saveAndRestart" value="Save and Conditionally Restart" />
</td>
</tr>
</table>
		
<!-- hidden store the audioDevList -->
<s:iterator value="audioDevList" status="stat">
  <s:hidden name="audioDevList[%{#stat.index}]" value="%{audioDevList[#stat.index]}" />
</s:iterator>

<!-- hidden store the status -->
<s:hidden name="status" />
	
</s:form>

<hr />
<h4>Notes</h4>
<p>This configuration page is for the Squeezelite Player Service.</p>
<ul>
<li>The Squeezelite Player runs on the device as a systemd service, under  
user <i>squeezelite</i>, group <i>squeezelite</i>, with RT privileges, 
allowing ALSA memory to be locked and the process output thread to run 
at a higher priority. The default output thread priority if not explicitly set, 
(using the drop-down field in the <i>Configuration</i> section above), is 46. 
The process is started with a nice value of -10. The service configuration file 
that you are editing using this web interface is 
&quot;/etc/sysconfig/squeezelite&quot;.</li>
<li>The <i>Service</i> status area at the top of the page, shows the current 
Squeezelite Player service status and is the output returned from running 
the command, &quot;systemctl&nbsp;status&nbsp;squeezelite&quot;.</li>
<li>The <i>Service</i> status area may be refreshed by pressing the 
<i>Refresh</i> button.
The service can be <i>Enable</i>d, <i>Disable</i>d, <i>Start</i>ed, 
(if not already running), <i>Stop</i>ped, (if running), or <i>Restart</i>ed, 
(stopped and started if running, or started if not running), using the 
respective control buttons.</li>
<li>Each configuration item has a tooltip, which provides an explanation of 
what the option does as well as the expected format for the option. 
Your web browser should display the tooltips when you move the mouse pointer 
over the &quot;i&quot; image icon next to the option.</li>
<li>By default on the Wandboard, the sgtl5000 codec is configured as the audio device, 
and the player name is set to &quot;SqueezeliteWAND&quot;</li>
<li>If the selected <i>Audio Device</i> name contains the string, 
&quot;sgtl5000&quot;, and the <i>Alsa Params</i> field is left unpopulated, 
a default value of &quot;40::16:&quot; will be submitted to the squeezelite config 
file, forcing the output of 16 bit audio. Althought the sgtl5000 codec is 24 bit capable, 
at the present time it results in distorted sound. Please be aware that once this 
value has been set and saved, it will remain if you change the selected 
<i>Audio Device</i>. So if you choose another device which is 24 bit capable, 
before saving, remember to delete the contents of the <i>Alsa Params</i> field.</li>
<li>Although a <i>plughw</i> selection should appear in the <i>Audio Device</i> 
drop-down for each available audio device, you should choose the <i>hw</i> selection. 
Squeezelite will automatically try and open the audio hardware device at the 
requested sample rate, and fallback to re-opening it using <i>plughw</i> if the 
hardware does not directly support the requested sample rate.</li>
<li>If the <i>Name</i> field is not populated before saving the configuration, 
the default value, &quot;SqueezeliteWAND&quot;, will be written to the 
config file.</li>
<li>If the <i>MAC Address</i> field is not populated before saving the configuration, 
the MAC address of the ethernet interface will be written to the config file.</li>
<li>If the <i>Log File</i> field is not populated before saving the configuration, 
the default value, &quot;/var/log/squeezelite/squeezelite.log&quot; will be 
written to the config file.</li>
<li>The configuration can be saved by pressing the <i>Save</i> button, in which case 
it will not take effect until the service is next manually started or restarted. 
Alternatively, the configuration may be saved using the 
<i>Save and Conditionally Restart</i> button, 
in which case the configuration will be saved and the service will be 
conditionally restarted. ie. If the service is running it will be restarted. 
If it is not already running, it will not be started. You will need to 
manually start it by pressing the <i>Start</i> button.</li>
<li>When you submit the configuration to be saved, it will be validated 
on the server-side. If any of the configuration parameters fail server-side 
validation, the web page will return with one (or more) messages, 
<font color="red">highlighted in red</font>, at 
the beginning of the <i>Configuration</i> section. These messages should be 
self-explanatory and enable you to &quot;adjust&quot; the 
indicated parameters, before you attempt to submit them again.</li>
<li>The Squeezelite program was written by and is Copyright &copy; 2013 Adrian Smith, 
otherwise known as <i>Triode</i> on the SlimDevices Forum. It is free software and 
released under the GNU GPL. Thank you, Adrian!</li>
</ul>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>
