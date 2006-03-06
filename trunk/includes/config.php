<?php
// $Id$

require_once("includes/db.php");

class Config {

	static function getStatic($name, $def = "") {
		$db = Database::singletone()->db();
		$q = $db->prepare("SELECT config_value FROM phpdns_config WHERE config_name = ?");
		if (PEAR::isError($q))
			die($q->getMessage());

		$r = $db->execute($q, $name);
		if (PEAR::isError($r))
			return $def;
		if ($r->numRows() == 0)
			return $def;
		$row = $r->fetchRow();
		return $row['config_value'];
	}

	static function get($name, $def = "") {
		return Config::getStatic($name, $def);
	}

	static function set($name, $val) {
		$db = Database::singletone()->db();
		$q = $db->prepare("SELECT config_value FROM phpdns_config WHERE config_name = ?");
		if (PEAR::isError($q)) {
			die($q->getMessage());
		}

		$r = $db->execute($q, $name);
		if (PEAR::isError($r))
			return $def;
		if ($r->numRows() == 0) {
			$q = $db->prepare("INSERT INTO Config (config_value, config_name) VALUES (?, ?)");
		} else {
			$q = $db->prepare("UPDATE Config SET config_value = ?, config_name = ?");
		}
		if (PEAR::isError($q))
			die($q->getMessage());

		$db->execute($q, array($val, $name));
	}
};

?>
