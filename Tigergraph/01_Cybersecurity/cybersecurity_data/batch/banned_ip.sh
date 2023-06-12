#!/bin/bash
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


cat src_banned_ip.csv | while read line
do 
	echo $line
	sleep 0.1;
	echo -e $line >> banned_ip.csv
	gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_banned_ip_csv using
	v_banned_ip=\"${cybersecurity_data_dir}/banned_ip.csv\""	
done
sleep 3;
