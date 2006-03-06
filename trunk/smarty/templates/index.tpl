<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
{* $Id$ *}

<head>
	<title>phpDNS - {$page_title}</title>
	<meta http-equiv="Pragma"  content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta name="Generator" content="vim, kwrite" />
	<meta name="robots" content="index, follow" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/screen.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div id="container">
		
		<div id="menu">
			<div class="menuitem"><a href="{url action="start"}">Start</a></div>
			<div class="menuitem"><a href="{url action="hosts"}">Serwery</a></div>
			<div class="menuitem"><a href="{url action="zones"}">Strefy</a></div>
			<div class="menuitem"><a href="{url action="users"}">Użytkownicy</a></div>
			<div class="menuitem"><a href="{url action="config"}">Konfiguracja</a></div>
		</div>
		
		<div id="content">
			{include file=$template}
		</div>
		
		<div style="clear: both;"></div>
	
	</div>

</body>

</html>
