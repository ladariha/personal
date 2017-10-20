rm -rf /tmp/bdm-fileuploadtest-0.1.0-SNAPSHOT.csv
hadoop fs -copyToLocal hdfs:/tmp/bdm-fileuploadtest-0.1.0-SNAPSHOT.csv /tmp/
md5sum /tmp/bdm-fileuploadtest-0.1.0-SNAPSHOT.csv
