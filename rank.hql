SET hive.auto.convert.join = false;

CREATE TABLE IF NOT EXISTS visits (
  name STRING,
  url STRING,
  time_s STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hadoopuser/lab_hive/data/visits.log'
OVERWRITE INTO TABLE visits;

SELECT * FROM visits;


CREATE TABLE IF NOT EXISTS pages (
  url STRING,
  pagerank DECIMAL(3,2)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hadoopuser/lab_hive/data/pages.log'
OVERWRITE INTO TABLE pages;

SELECT * FROM pages;


CREATE TABLE IF NOT EXISTS rank_results AS
SELECT DISTINCT v.name
FROM visits v
JOIN pages p ON v.url = p.url
WHERE p.pagerank > 0.5
ORDER BY v.name;

