<html>
<head>
    <meta http-equiv="Content-Language" content="en-gb">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

    <script language="javascript" type="text/javascript">
    function showFrame() {
        var e = document.getElementById("if1");
        e.style.visibility = "visible" ;
    }
    </script>
</head>

<body>
	<form method="get" action="http://www.google.com/search" onclick="showFrame()">

		<div style="border:1px solid black;padding:4px;width:20em;">
		<table border="0" cellpadding="0">
		<tr><td>
		<input type="text"   name="q" size="25"
		 maxlength="255" value="" />
		<input type="submit" value="Google Search" /></td></tr>
		<tr><td align="center" style="font-size:75%">
		<input type="checkbox"  name="sitesearch"
 		value="www.ipu.ac.in" checked /> only search IPU<br />
		</td></tr></table>
		</div>
	</form>
    <p> </p>
    <p>
    <span id="spSearch" onclick="showFrame()">Search</span>
    </p>
    <p> </p>
    <p><iframe name="I1" id="if1" width="100%" height="254" style="visibility:hidden" src="http://www.google.co.in">
        Your browser does not support inline frames or is currently configured not to display inline frames.
    </iframe></p>
</body>
</html>