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
		  <s:param name="request_locale">fr</s:param>
		</s:url>
		<s:a href="%{fr}"><s:text name="language.fr" /></s:a>
		<!-- Danish -->
		<s:url id="da">
		  <s:param name="request_locale">da</s:param>
		</s:url>
		<s:a href="%{da}"><s:text name="language.da" /></s:a>
		<!-- Dutch -->
		<s:url id="nl">
		  <s:param name="request_locale">nl</s:param>
		</s:url>
		<s:a href="%{nl}"><s:text name="language.nl" /></s:a>
		<!-- German -->
		<s:url id="de">
		  <s:param name="request_locale">de</s:param>
		</s:url>
		<s:a href="%{de}"><s:text name="language.de" /></s:a>
		<!-- Italian -->
		<s:url id="it">
		  <s:param name="request_locale">it</s:param>
		</s:url>
		<s:a href="%{it}"><s:text name="language.it" /></s:a>
		<!-- Swedish -->
		<s:url id="sv">
		  <s:param name="request_locale">sv</s:param>
		</s:url>
		<s:a href="%{sv}"><s:text name="language.sv" /></s:a>
	</p>
</div>

