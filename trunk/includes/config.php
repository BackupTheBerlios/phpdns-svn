<?php
// $Id$

require_once("includes/db.php");

class Config {

	var $_config;

	function __construct() {
	}

	static function getStatic($name, $def = "") {
		// TODO
	}

	static function get($name, $def = "") {
		return Config::getStatic($name, $def);
	}

	static function set($name, $val) {
		// TODO
	}
};

?>
