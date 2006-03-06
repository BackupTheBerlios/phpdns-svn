
create table if not exists phpdns_config (
	config_name varchar(255) character set utf8 collate utf8_general_ci not null unique,
	config_value text character set utf8 collate utf8_general_ci,
	primary key(config_name)
) character set utf8 collate utf8_general_ci ENGINE=InnoDB;

create table if not exists phpdns_users (
	user_id integer not null unique auto_increment,
	user_login varchar(128) character set utf8 collate utf8_general_ci not null unique,
	user_pass varchar(32) character set utf8 collate utf8_general_ci not null, -- password MD5 
	user_name varchar(256) character set utf8 collate utf8_general_ci,
	user_email varchar(256) character set utf8 collate utf8_general_ci,
	user_registered integer(11) default 0,
	user_lastlogin integer(11) default 0,
	user_level integer not null default 0,
	primary key(user_id)
) character set utf8 collate utf8_general_ci ENGINE=InnoDB;

create table if not exists phpdns_sessions (
	session_id varchar(32) not null unique,
	session_start integer(11) not null,
	session_time integer(11) not null,
	session_ip char(8) not null,
	user_id integer default null references phpdns_users(user_id) on delete cascade,
	primary key(session_id)
) character set utf8 collate utf8_general_ci ENGINE=InnoDB;

create table if not exists phpdns_session_history (
	session_id varchar(32) not null unique,
	session_start integer(11) not null,
	session_ip char(8) not null,
	user_id integer default null references phpdns_users(user_id) on delete cascade,
	primary key(session_id)
) character set utf8 collate utf8_general_ci ENGINE=InnoDB;

create table if not exists phpdns_user_ip (
	user_id integer not null references phpdns_users(user_id) on delete cascade,
	ip char(8) not null,
	last_visit integer(11) not null,
	primary key(user_id, ip)
) character set utf8 collate utf8_general_ci ENGINE=InnoDB;

create table if not exists phpdns_zones (
	zone_id integer not null unique auto_increment,
	zone_name varchar(255) character set utf8 collate utf8_general_ci not null unique,
	zone_type varchar(32) character set utf8 collate utf8_general_ci not null,
	zone_serial integer(11) not null default 1,
	zone_admin varchar(128) character set utf8 collate utf8_general_ci not null,
	zone_refresh integer(11) not null default 10800,
	zone_retry integer(11) not null default 900,
	zone_expiry integer(11) not null default 604800,
	zone_minimum integer(11) not null default 86400,
	zone_ttl integer(11) not null default 3600,
	zone_origin varchar(256) character set utf8 collate utf8_general_ci not null,
	primary key(zone_id)
) character set utf8 collate utf8_general_ci ENGINE=InnoDB;
