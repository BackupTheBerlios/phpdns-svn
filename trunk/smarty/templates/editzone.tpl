{* $Id$ *}
{if $mode eq "add"}
<h1>Dodaj strefę</h1>
<div class="submenu">
	SOA
</div>
{elseif $mode eq "edit"}
<h1>Strefa {$zone.zone_name|escape}</h1>
<div class="submenu">
	SOA |
	<a href="{url action="zonens"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">NS</a> |
	<a href="{url action="zonemx"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">MX</a> |
	<a href="{url action="zonea"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">A</a> |
	<a href="{url action="zonea6"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">AAAA/A6</a> |
	<a href="{url action="zonesrv"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">SRV</a> |
	<a href="{url action="zonerx"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">Wszystkie rekordy</a> |
	<a href="{url action="zoneprv"}&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}">Podgląd</a>
</div>
{/if}

<br />

<form method="post" action="{url action="editzone"}&amp;mode={$mode}&amp;submit=1&amp;zid={$zone.zone_id}">
<input type="hidden" name="ref" value="{$ref|escape}" />
<input type="hidden" name="submit" value="1" />
{if $mode eq "edit"}
<input type="hidden" name="zid" value="{$zone.zone_id}" />
{/if}
<table>
<tr><td><label>Nazwa:</label></td><td><input type="text" name="zone_name" value="{$zone.zone_name|escape}" /></td></tr>
<tr><td><label>Typ:</label></td><td><input type="text" name="zone_type" value="{$zone.zone_type|escape}" /></td></tr>
<tr><td><label>Serial:</label></td><td><input type="text" name="zone_serial" value="{$zone.zone_serial|escape}" /></td></tr>
<tr><td><label>Admin:</label></td><td><input type="text" name="zone_admin" value="{$zone.zone_admin|escape}" /></td></tr>
<tr><td><label>Nameserver:</label></td><td><input type="text" name="zone_origin" value="{$zone.zone_origin|escape}" /></td></tr>
<tr><td><label>Refresh:</label></td><td><input type="text" name="zone_refresh" value="{$zone.zone_refresh|escape}" /></td></tr>
<tr><td><label>Retry:</label></td><td><input type="text" name="zone_retry" value="{$zone.zone_retry|escape}" /></td></tr>
<tr><td><label>Expiry:</label></td><td><input type="text" name="zone_expiry" value="{$zone.zone_expiry|escape}" /></td></tr>
<tr><td><label>Minimum:</label></td><td><input type="text" name="zone_minimum" value="{$zone.zone_minimum|escape}" /></td></tr>
<tr><td><label>TTL:</label></td><td><input type="text" name="zone_ttl" value="{$zone.zone_ttl|escape}" /></td></tr>
<tr><td colspan="2">
	{if $mode eq "edit"}
		<input type="submit" value="Zapisz" />
	{elseif $mode eq "add"}
		<input type="submit" value="Dodaj" />
	{/if}
</td></tr>
</table>
</form>
