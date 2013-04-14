<%@ taglib uri="/struts-tags" prefix="s" %>

<div id="navigation" class="curved container">
	<span id="nav-home">
		<a href="Index.action">
			<s:text name="nav.home" />
		</a>
	</span> 
	<span id="nav-wired">
		<a href="Ethernet_populate.action">
			<s:text name="nav.wired" />
		</a>
	</span> 
	<span id="nav-wireless">
		<a href="Wireless_populate.action">
			<s:text name="nav.wireless" />
		</a>
	</span> 
	<span id="nav-squeezelite">
		<a href="Squeezelite_populate.action">
			<s:text name="nav.squeezelite" />
		</a>
	</span> 
	<span id="nav-squeezeserver">
		<a href="SqueezeServer_populate.action">
			<s:text name="nav.squeezeserver" />
		</a>
	</span> 
	<span id="nav-fstab">
		<a href="Fstab_populate.action">
			<s:text name="nav.fstab" />
		</a>
	</span>
	<span id="nav-shutdown">
		<a href="Shutdown.action">
			<s:text name="nav.shutdown" />
		</a>
	</span> 
	<span id="nav-help">
		<a href="Index.action">
			<s:text name="nav.help" />
		</a>
	</span> 
	<br class="separator" />
</div>
