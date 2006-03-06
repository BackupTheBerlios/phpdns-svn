{* $Id$ *}
<h1>Strefy</h1>

<div class="submenu">
	<a href="{url action="editzone"}&amp;ref={$self|escape:"url"}&amp;mode=add">Dodaj strefę</a>
</div>
<br />

<table style="width: 100%;">
	<thead>
		<tr>
			<th>Nazwa</th>
			<th>Typ</th>
			<th>Serial</th>
			<th></th>
		</tr>
	</thead>
	
	<tbody>
		{foreach from=$zones item=zone}
			<tr>
				<td>{$zone.zone_name|escape}</td>
				<td>{$zone.zone_type|escape}</td>
				<td>{$zone.zone_serial|escape}</td>
				<td style="text-align: right;">
					<a href="{url action="editzone"}&amp;mode=edit&amp;zid={$zone.zone_id}&amp;ref={$self|escape:"url"}"><img src="images/edit.gif" alt="Edytuj" /></a>
					<a href="{url action="deletezone"}&amp;mode=edit&amp;zid={$zone.zone_id};&amp;ref={$self|escape:"url"}"><img src="images/trash.gif" alt="Usuń" /></a>
				</td>
			</tr>
		{/foreach}
	</tbody>

</table>
