<?php
// $Id$

require_once("DB.php");
require_once("config/config.php");


class Session {
	
	private static $_database = null;
	private $_db = null;

	private function __construct() {

		global $db_dsn, $db_options;

		$this->_db = &DB::connect($db_dsn, $db_options);
		if (PEAR::isError($this->_db)) {
			die($this->_db->getMessage());
		}

		$this->_db->setFetchMode(DB_FETCHMODE_ASSOC);
	}

	public static function create() {
		if (self::$_database == null)
			self::$_database = new Database();
	}

	public static function singletone() {
		self::create();
		return self::$_database;
	}

	public function db() {
		return $this->_db;
	}
}

?>
