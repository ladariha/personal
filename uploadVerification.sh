rm -rf /tmp/2017-04-01.csv
hadoop fs -copyToLocal hdfs:/user/test201710190553542/2017-04-01.csv /tmp/
md5sum /tmp/2017-04-01.csv
