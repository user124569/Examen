cual=bdficompose
docker-compose --project-name ${cual}  -- up  -d

docker exec -it ${cual}_miAirflow_1 bash -c "cd /opt/airflow && resources/download_data.sh"

docker exec -it ${cual}_miMongo_1 bash -c "mongoimport -d agile_data_science -c origin_dest_distances --file /opt/practicas/data/origin_dest_distances.jsonl && \
                                 mongo agile_data_science --eval 'db.origin_dest_distances.ensureIndex({Origin: 1, Dest: 1})'"