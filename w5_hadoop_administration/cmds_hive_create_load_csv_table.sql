CREATE TABLE IF NOT EXISTS NewBatting 
(playerID string, yearID string, stint string, teamID string, lgID string, 
G string, G_batting string, AB string, R string, H string, B2 string, 
B3 string, HR string, RBI string, SB string, CS string, BB string, SO string,
IBB string, HBP string, SH string, SF string, GIDP string, G_old string) 
-- créé la table newbatting qui contient les attributs suivants et leurs types 
ROW FORMAT DELIMITED 
-- tells Hive to expect the data file to contain one row per line 
-- so basically, we are telling Hive that when it finds a new line character that means it is a new record
FIELDS TERMINATED BY ';' 
-- tells Hive that when it finds a ';' in the data file, that means it is a new column. 
-- This way Hive knows what delimiter you are using in your data files to separate each column. 
TBLPROPERTIES ("skip.header.line.count"="1");
-- tells hive to skip header at first line in data file
-- Rq: data file = csv file that will be loaded into table (-> cf next step)


LOAD DATA INPATH '/user/thomas/Batting.csv' OVERWRITE INTO TABLE newbatting; 
-- charge le contenu du fichier HDFS Batting.csv dans la table newbatting de hive
-- Rq LOAD DATA INPATH pour charger un fichier HDFS vers hive
-- Rq2: dans le system HDFS la table newbatting est un répertoire qui va contenir ce fichier csv
-- Rq3: les colonnes du fichier csv doivent correspondre aux colonnes/attributs de la table newbatting
-- définies dans le .metastore de hive


