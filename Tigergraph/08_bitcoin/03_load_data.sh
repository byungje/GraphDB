echo "date now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

## PLEASE modify the line below to the directory where your raw file sits and remove the '#'
export bitcoin_data_dir=/home/tigergraph/07_Block_chain/bitcoin_data


#start all TigerGraph services
gadmin start all

gsql -g Block_Chain "run loading job load_blockchain_data using
v_blocks=\"${bitcoin_data_dir}/blocks.csv\",
v_outputs=\"${bitcoin_data_dir}/output.csv\",
v_input=\"${bitcoin_data_dir}/input.csv\",
v_txns=\"${bitcoin_data_dir}/transactions.csv\""

echo "date now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
