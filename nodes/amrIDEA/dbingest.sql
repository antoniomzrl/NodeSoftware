

USE radamdb;
LOAD DATA LOCAL INFILE '/home/roldan/NodeSoftware/nodes/amrIDEA/states.out' INTO TABLE states      COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
LOAD DATA LOCAL INFILE '/home/roldan/NodeSoftware/nodes/amrIDEA/lines.out'  INTO TABLE transitions COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
INSERT INTO species (id, element, nuclearcharge, ioncharge)  SELECT DISTINCT species,element,nuclearcharge,ioncharge FROM states;

#LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/amrIDEA/references.in'  IGNORE INTO TABLE refs        COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
#LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/amrIDEA/species.in'     IGNORE INTO TABLE species     COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
#LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/amrIDEA/states.in'      IGNORE INTO TABLE states      COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';
#LOAD DATA INFILE '/home/roldan/NodeSoftware/nodes/amrIDEA/transitions.in' IGNORE INTO TABLE transitions COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"';

#CREATE VIEW radamdb.Vrf AS SELECT * FROM radamdb.refs;
CREATE VIEW radamdb.Vsp AS SELECT * FROM radamdb.species;
CREATE VIEW radamdb.Vst AS SELECT * FROM radamdb.states;
CREATE VIEW radamdb.Vtr AS SELECT * FROM radamdb.transitions;
