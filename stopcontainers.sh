echo -e "\nStopping containers ....."
docker stop $(docker ps -a | grep postgres | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep kafka | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep zookeeper | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep kafka-connec | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep schema-registry | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep akhq | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep elasticsearch | cut -d ' ' -f 1)
docker stop $(docker ps -a | grep kibana | cut -d ' ' -f 1)
docker rm postgres
docker rm kafka
docker rm zookeeper
docker rm kafka-connect
docker rm schema-registry
docker rm akhq
docker rm elasticsearch
docker rm kibana
echo -e "\nAll Containers stopped."