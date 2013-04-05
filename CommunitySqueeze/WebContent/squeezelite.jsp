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
		size="30" />
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
		size="30" />
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
		size="30" />
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
		size="30" />
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
		size="30"/>
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
		size="30" />
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
		size="30" />
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
		size="30" />
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
		size="30" />
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
<jsp:include page="Footer.jsp"/>

</body>
</html>
