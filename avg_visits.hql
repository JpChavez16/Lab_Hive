CREATE TABLE IF NOT EXISTS pages (
  name STRING,
  url STRING,
  time_s STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hadoopuser/lab_hive/data/visits.log'
OVERWRITE INTO TABLE pages;


SELECT * FROM pages;

CREATE TABLE IF NOT EXISTS avg_visit AS
SELECT AVG(num_pages) AS avg_pages_per_user
FROM (
  SELECT name, COUNT(*) AS num_pages
  FROM pages
  GROUP BY name
) AS user_counts;

