<%@ taglib uri="/struts-tags" prefix="s" %>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-39534384-1']);
  _gaq.push(['_trackPageview']);
      
  (function() {
    var ga = document.createElement('script'); ga.type =
     'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ?
              'https://ssl' : 'http://www') +
              '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(ga, s);
  })();
                      
</script>

<div id="navigation" class="curved container">

	<span id="nav-home">
		<s:a href="index.jsp">
			<s:text name="nav.home" />
		</s:a>
	</span> 

	<span id="nav-faq">
		<s:a href="faq.jsp">
			<s:text name="nav.faq" />
		</s:a>
	</span> 

	<span id="nav-jivelite">
		<s:a href="jivelite_about.jsp">
			<s:text name="nav.jivelite" />
		</s:a>
	</span> 

	<span id="nav-quick_start_guide">
		<s:a href="quick_start_guide.jsp">
			<s:text name="nav.qsg" />
		</s:a>
	</span> 

	<span id="nav-squeezelite">
		<s:a href="squeezelite_about.jsp">
			<s:text name="nav.squeezelite" />
		</s:a>
	</span> 

	<span id="nav-help">
		<s:a href="help.jsp">
			<s:text name="nav.help" />
		</s:a>
	</span> 

	<br class="separator" />

</div>
