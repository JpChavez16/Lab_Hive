CREATE TABLE IF NOT EXISTS logs (
  user_a STRING,
  time_s STRING,
  query STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hadoopuser/lab_hive/excite-small.log' OVERWRITE INTO TABLE logs;

SELECT * FROM logs;

CREATE TABLE IF NOT EXISTS result AS
SELECT user_a, COUNT(*) AS log_entries
FROM logs
GROUP BY user_a
ORDER BY user_a;

