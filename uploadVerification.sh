rm -rf /tmp/bdm-fileuploadtest-0.1.0-20180524.125824-2.csv
hadoop fs -copyToLocal hdfs:/tmp/bdm-fileuploadtest-0.1.0-20180524.125824-2.csv /tmp/
md5sum /tmp/bdm-fileuploadtest-0.1.0-20180524.125824-2.csv
