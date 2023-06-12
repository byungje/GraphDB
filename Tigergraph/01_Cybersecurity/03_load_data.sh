echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

## PLEASE modify the line below to the directory where your raw file sits and remove the '#'
export cybersecurity_data_dir=/home/tigergraph/01_Cybersecurity/cybersecurity_data/


#start all TigerGraph services
gadmin start all

gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_server_alert_csv using
v_server_alert=\"${cybersecurity_data_dir}/server_alert.csv\""

gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_service_alert_csv using
v_service_alert=\"${cybersecurity_data_dir}/service_alert.csv\""

##gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_banned_ip_csv using
##v_banned_ip=\"${cybersecurity_data_dir}/banned_ip.csv\""

gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_service_csv using
v_service=\"${cybersecurity_data_dir}/service.csv\""

gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_resource_csv using
v_resource=\"${cybersecurity_data_dir}/resource.csv\""

gsql -p 1120 -g Cybersecurity_IT "run loading job load_job_syslog_csv using
v_syslog=\"${cybersecurity_data_dir}/syslog.csv\""

echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
