#!/bin/bash
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


cat src_syslog.csv | while read line
do
        echo $line
        sleep 0.1;
        echo -e $line >> syslog.csv
        gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_syslog_csv using
        v_syslog=\"${cybersecurity_data_dir}/syslog.csv\""
done
sleep 3;
