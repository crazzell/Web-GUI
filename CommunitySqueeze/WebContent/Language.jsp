<%@ taglib uri="/struts-tags" prefix="s" %>

<!-- Language -->
<div align="right">
	<p class="language"><s:text name="language.language" />:
		<!-- English -->
		<s:url id="en">
		  <s:param name="request_locale">en</s:param>
		</s:url>
		<s:a href="%{en}"><s:text name="language.en" /></s:a>
		<!-- French -->
		<s:url id="fr">
		  <s:param name="request_locale"><s:text name="language.fr" /></s:param>
		</s:url>
		<s:a href="%{fr}">French</s:a>
		<!-- Dutch -->
		<s:url id="nl">
		  <s:param name="request_locale"><s:text name="language.nl" /></s:param>
		</s:url>
		<s:a href="%{nl}">Dutch</s:a>
		<!-- German -->
		<s:url id="de">
		  <s:param name="request_locale"><s:text name="language.de" /></s:param>
		</s:url>
		<s:a href="%{de}">German</s:a>
		<!-- Italian -->
		<s:url id="it">
		  <s:param name="request_locale"><s:text name="language.it" /></s:param>
		</s:url>
		<s:a href="%{it}">Italian</s:a>
		<!-- Swedish -->
		<s:url id="sv">
		  <s:param name="request_locale"><s:text name="language.sv" /></s:param>
		</s:url>
		<s:a href="%{sv}">Swedish</s:a>
	</p>
</div>

