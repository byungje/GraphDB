#!/bin/bash
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


cat src_resource.csv | while read line
do
        echo $line
        sleep 0.1;
        echo -e $line >> resource.csv
        gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_resource_csv using
        v_resource=\"${cybersecurity_data_dir}/resource.csv\""
done
sleep 3;
