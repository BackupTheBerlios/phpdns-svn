<?php
// $Id$

require_once("includes/utils.php");
require_once("includes/smarty.php");
require_once("includes/db.php");


$url = Config::get("site_url");
$ref = Utils::pg("ref");
$page = Utils::pg("p", 0);
$count = Utils::pg("c", 20);
$action = Utils::pg("action", "start");

$smarty = new phpDNS_Smarty($action);
$smarty->register_function('url', 'smarty_url');
$smarty->assign('ref', $ref);
$smarty->assign('self', Utils::selfURL());

$templates = array();

$actions = array(
	"zones" => "action_zones",
	"servers" => "action_server",
	"config" => "action_config",
	"users" => "action_users",
	"editzone" => "action_editzone"
);

if (!empty($templates[$action]))
	$template = $templates[$action];
else
	$template = $action . ".tpl";

function url($action, $attrs = array()) {
	global $ref, $url;
	//$session = Session::singletone();

	$s = $url . "/index.php?action=$action";
	//$s = $session->addSID($s);
//	if (!empty($ref))
//		$s .= "&amp;ref=" . htmlspecialchars(urlencode($ref));

	foreach ($attrs as $id => $val) {
		$s .= htmlspecialchars("&$id=" . urlencode($val));
	}

	return $s;
}

function smarty_url($params, &$smarty) {
	return url($params['action']);
}

function action_zones() {
	global $smarty;
	$db = Database::singletone()->db();
	
	$q = $db->prepare("SELECT * FROM phpdns_zones ORDER BY zone_name");
	$r = $db->execute($q);
	$zones = array();
	while ($row = $r->fetchRow()) {
		$zones[] = $row;
	}
	$smarty->assign("zones", $zones);
}

function action_editzone() {

	global $smarty, $ref;
	$db = Database::singletone()->db();
	
	$date = getdate();
	$submit = Utils::p("submit", 0);

	$zid = Utils::pg("zid", 0);
	$mode = Utils::pg("mode", "add");
	$smarty->assign("mode", $mode);
	
	$zone = array();

	if (!$submit) {
		
		if ($mode == "add") {
			$zone['zone_name'] = "";
			$zone['zone_type'] = "IN";
			$zone['zone_serial'] = sprintf("%04d%02d%02d01", $date['year'], $date['mon'], $date['mday']);
			$zone['zone_admin'] = "";
			$zone['zone_origin'] = "";
			$zone['zone_refresh'] = 10800;
			$zone['zone_retry'] = 900;
			$zone['zone_expiry'] = 604800;
			$zone['zone_minimum'] = 86400;
			$zone['zone_ttl'] = 3600;
		} else {
			$q = $db->prepare("SELECT * FROM phpdns_zones WHERE zone_id = ?");
			$r = $db->execute($q, $zid);
			$zone = $r->fetchRow();
		}
		
		$smarty->assign("zone", $zone);
	} else {
	
		$zone['zone_name'] = Utils::p("zone_name");
		$zone['zone_type'] = Utils::p("zone_type");
		$zone['zone_serial'] = Utils::p("zone_serial");
		$zone['zone_admin'] = Utils::p("zone_admin");
		$zone['zone_origin'] = Utils::p("zone_origin");
		$zone['zone_refresh'] = Utils::p("zone_refresh");
		$zone['zone_retry'] = Utils::p("zone_retry");
		$zone['zone_expiry'] = Utils::p("zone_expiry");
		$zone['zone_minimum'] = Utils::p("zone_minimum");
		$zone['zone_ttl'] = Utils::p("zone_ttl");

		if ($mode == "add") {
			$q = $db->prepare("INSERT INTO phpdns_zones (zone_name, zone_type, zone_serial, zone_admin, zone_origin, zone_refresh, zone_retry, zone_expiry, zone_minimum, zone_ttl) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			$db->execute($q, array_values($zone));
		} else if ($mode == "edit") {
			$q = $db->prepare("UPDATE phpdns_zones SET zone_name = ?, zone_type = ?, zone_serial = ?, zone_admin = ?, zone_origin = ?, zone_refresh = ?, zone_retry = ?, zone_expiry = ?, zone_minimum = ?, zone_ttl = ? WHERE zone_id = ?");
			$z = array_values($zone);
			$z[] = $zid;
			$db->execute($q, $z);
		}
		

		header("Location: " . $ref);
	}
}

Utils::negotiateContentType();

ob_start();

if (!empty($actions[$action]))
	eval($actions[$action] . "();");

$smarty->assign("template", $template);
$smarty->display("index.tpl");
	
ob_flush();

?>
