echo -e "\nStopping containers ....."
docker stop $(docker ps -a | grep postgres | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep kafka | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep zookeeper | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep kafka-connec | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep schema-registry | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep akhq | cut -d ' ' -f 1)
docker rm postgres
docker rm kafka
docker rm zookeeper
docker rm kafka-connect
docker rm schema-registry
docker rm akhq
echo -e "\nAll Containers stopped."