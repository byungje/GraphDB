echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

## PLEASE modify the line below to the directory where your raw file sits and remove the '#'
export cora_data_dir=/home/tigergraph/02_Cora/cora_data/

#start all TigerGraph services
gadmin start all

gsql -g Cora "run loading job load_cora_data using
node_csv=\"${cora_data_dir}/nodes.csv\",
edge_csv=\"${cora_data_dir}/edges.csv\""

echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

