echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"

## PLEASE modify the line below to the directory where your raw file sits and remove the '#'
export movie_data_dir=/home/tigergraph/05_movie/movie-rec_data/

#start all TigerGraph services
gadmin start all

gsql -g recommend_movie -p 1120 "run loading job load_job_accounts using
v_movies=\"${movie_data_dir}/movies.csv\""

gsql -g recommend_movie -p 1120 "run loading job load_job_alerts using
v_ratings=\"${movie_data_dir}/ratings.csv\""

echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"