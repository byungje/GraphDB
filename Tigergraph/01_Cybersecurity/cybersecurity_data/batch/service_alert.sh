#!/bin/bash
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


cat src_service_alert.csv | while read line
do
        echo $line
        sleep 0.1;
        echo -e $line >> service_alert.csv
        gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_service_alert_csv using
        v_service_alert=\"${cybersecurity_data_dir}/service_alert.csv\""
done
sleep 3;
