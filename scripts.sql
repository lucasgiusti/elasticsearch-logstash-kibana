CREATE TABLE db.logstashTest (
  id BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY unique_id (id),
  client_name VARCHAR(32) NOT NULL,
  modification_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  insertion_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO db.logstashTest (id, client_name) VALUES (1, 'Cliente 1');
INSERT INTO db.logstashTest (id, client_name) VALUES (2, 'Cliente 2');

update db.logstashTest set client_name='Cliente 2' where id=2;

SELECT 
	 *, 
	 UNIX_TIMESTAMP(modification_time) AS unix_ts_in_secs 
FROM db.logstashTest 
WHERE (modification_time < NOW()) ORDER BY modification_time ASC;