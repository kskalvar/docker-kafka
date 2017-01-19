# build
cd docker-kafka
docker build -t kafka-runtime .

# run
docker run -d -h localhost -p 2181:2181 -p 9092:9092 --name kafka kafka-runtime

# test
wget localhost:2181
wget localhost:9092

# attach
docker exec -it kafka bash
