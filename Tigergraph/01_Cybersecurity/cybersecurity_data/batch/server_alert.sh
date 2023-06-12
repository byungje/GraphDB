#!/bin/bash
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


cat src_server_alert.csv| while read line
do
        echo $line
        sleep 0.1;
        echo -e $line >> server_alert.csv
        gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_server_alert_csv using
        v_server_alert=\"${cybersecurity_data_dir}/server_alert.csv\""
done
sleep 3;
