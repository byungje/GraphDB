echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

## PLEASE modify the line below to the directory where your raw file sits and remove the '#'
export SCM_data_dir=/home/tigergraph/GraphDB/Tigergraph/07_SCM/SCM_data/


#start all TigerGraph services
gadmin start all

gsql -p 1120 -g SCM "run loading job load_job_server_alert_csv using
v_usedBy=\"${SCM_data_dir}/usedBy.csv\""

gsql -p 1120 -g SCM "run loading job load_job_service_alert_csv using
v_product=\"${SCM_data_dir}/product.csv\""

##gsql -p 1120 -g SCM "run loading job load_job_banned_ip_csv using
##v_banned_ip=\"${SCM_data_dir}/banned_ip.csv\""

gsql -p 1120 -g SCM "run loading job load_job_service_csv using
v_order=\"${SCM_data_dir}/order.csv\""

gsql -p 1120 -g SCM "run loading job load_job_resource_csv using
v_stocking=\"${SCM_data_dir}/stocking.csv\""

gsql -p 1120 -g SCM "run loading job load_job_syslog_csv using
v_produce=\"${SCM_data_dir}/produce.csv\""

gsql -p 1120 -g SCM "run loading job load_job_syslog_csv using
v_deliver=\"${SCM_data_dir}/deliver.csv\""

echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"