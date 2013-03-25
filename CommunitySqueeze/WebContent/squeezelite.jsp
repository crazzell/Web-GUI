<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Community Squeeze OS: Squeezelite Player Configuration and Control</title>
</head>
<body>
<h2>Squeezelite Player Configuration and Control</h2>

<hr />
<s:actionerror />

<s:form action="Squeezelite" theme="simple" >
	<s:textarea name="status" cols="100" rows="4"/>
	<br />
	<s:submit action="Squeezelite_populate" value="Status" />
	<s:submit action="Squeezelite_enableService" value="Enable" />
	<s:submit action="Squeezelite_disableService" value="Disable" />
	<s:submit action="Squeezelite_startService" value="Start" />
	<s:submit action="Squeezelite_stopService" value="Stop" />
	<s:submit action="Squeezelite_restartService" value="Restart" />
</s:form>

<hr />

<s:form action="Squeezelite" >
	<s:textfield name="name" label="Name" 
		tooltip="Set the player name" />
	<s:textfield name="mac" label="MAC Address" 
		tooltip="Set mac address, format: ab:cd:ef:12:34:56" />
	<!-- <s:textfield name="audioDev" label="Audio Device" /> -->
	<s:select name="audioDev" list="audioDevList" label="Audio Device" 
		tooltip="Specify output device, default 'default' if not specified" />
	<s:textfield name="maxRate" label="Max Sample Rate" 
		tooltip="Max sample rate for output device, enables output device to be off when squeezelite is started, format: <rate>" />
	<s:textfield name="logFile" label="Log File" 
		tooltip="Write debug to logfile, format: <logfile>" />
	<s:textfield name="logLevel" label="Log Level" 
		tooltip="Set logging level, format: <log>=<level> [<log>=<level> <log>=<level> ...],
		 logs: all|slimproto|stream|decode|output, 
		 level: info|debug|sdebug" />
	<s:select name="priority" list="priorityList" label="RT Thread Priority" 
		tooltip="Set real time priority of output thread" />
	<s:textfield name="buffer" label="Buffer" 
		tooltip="Specify internal Stream and Output buffer sizes in Kbytes, format: <stream>:<output>" />
	<s:textfield name="codec" label="Codec" 
		tooltip="Restrict codecs those specified, otherwise loads all available codecs; 
		 format: <codec1>[,<codec2>,<codec3>,...]
		 known codecs: flac,pcm,mp3,ogg,aac (mad,mpg for specific mp3 codec)" />
	<s:textfield name="alsaParams" label="Alsa Params" 
		tooltip="Specify ALSA params to open output device, format: <b>:<c>:<f>:<m>, 
		 b = buffer time in ms, 
		 c = period count, 
		 f = sample format (16|24|24_3|32), 
		 m = use mmap (0|1)" />
	<s:textfield name="serverIp" label="Server IP Address" 
		tooltip="Connect to specified server, otherwise uses autodiscovery to find server" />
	
	<s:submit action="Squeezelite_save" value="Save" />
	<s:reset key="button.reset"/>
	
</s:form>

<hr />
<jsp:include page="Footer.jsp"/>

</body>
</html>