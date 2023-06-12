echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

## PLEASE modify the line below to the directory where your raw file sits and remove the '#'
export amlsim_data_dir=/home/tigergraph/04_AMLSim/amlsim_data/


#start all TigerGraph services
gadmin start all

gsql -g AMLSim -p 1120 "run loading job load_job_accounts using
v_account=\"${amlsim_data_dir}/accounts.csv\""

gsql -g AMLSim -p 1120 "run loading job load_job_alerts using
v_alerts=\"${amlsim_data_dir}/alerts.csv\""

gsql -g AMLSim -p 1120 "run loading job load_job_transactions using
v_transactions=\"${amlsim_data_dir}/transactions.csv\""

echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
