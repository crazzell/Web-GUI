<%@ taglib uri="/struts-tags" prefix="s" %>

<!-- Language -->
<div align="right">
	<p class="language">Language:
		<!-- English -->
		<s:url id="en">
		  <s:param name="request_locale">en</s:param>
		</s:url>
		<s:a href="%{en}">English</s:a>
		<!-- French -->
		<s:url id="fr">
		  <s:param name="request_locale">fr</s:param>
		</s:url>
		<s:a href="%{fr}">French</s:a>
		<!-- Dutch -->
		<s:url id="nl">
		  <s:param name="request_locale">nl</s:param>
		</s:url>
		<s:a href="%{nl}">Dutch</s:a>
		<!-- German -->
		<s:url id="de">
		  <s:param name="request_locale">de</s:param>
		</s:url>
		<s:a href="%{de}">German</s:a>
		<!-- Italian -->
		<s:url id="it">
		  <s:param name="request_locale">it</s:param>
		</s:url>
		<s:a href="%{it}">Italian</s:a>
		<!-- Swedish -->
		<s:url id="sv">
		  <s:param name="request_locale">sv</s:param>
		</s:url>
		<s:a href="%{sv}">Swedish</s:a>
	</p>
</div>

