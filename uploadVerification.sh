rm -rf /tmp/bdm-fileuploadtest-0.1.0-20171019.090638-1.csv
hadoop fs -copyToLocal hdfs:/tmp/bdm-fileuploadtest-0.1.0-20171019.090638-1.csv /tmp/
md5sum /tmp/bdm-fileuploadtest-0.1.0-20171019.090638-1.csv
