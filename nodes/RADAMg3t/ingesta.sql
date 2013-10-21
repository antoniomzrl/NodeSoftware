#
# replace with correct paths, then feed to e.g. mysql with 
#
# $ mysql -u <databaseuser> -p < load.sql 
#

#DROP DATABASE IF EXISTS radamdb;
#CREATE DATABASE radamdb;

USE radamdb
LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/RADAMg3t/references.in'  IGNORE INTO TABLE refs        COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/RADAMg3t/species.in'     IGNORE INTO TABLE species     COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/RADAMg3t/states.in'      IGNORE INTO TABLE states      COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/RADAMg3t/transitions.in' IGNORE INTO TABLE transitions COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';

CREATE VIEW radamdb.Vrf AS SELECT * FROM radamdb.refs;
CREATE VIEW radamdb.Vsp AS SELECT * FROM radamdb.species;
CREATE VIEW radamdb.Vst AS SELECT * FROM radamdb.states;
CREATE VIEW radamdb.Vtr AS SELECT * FROM radamdb.transitions;
