#!/bin/bash
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


cat src_service.csv | while read line
do
        echo $line
        sleep 0.1;
        echo -e $line >> service.csv
        gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_service_csv using
        v_service=\"${cybersecurity_data_dir}/service.csv\""
done
sleep 3;
