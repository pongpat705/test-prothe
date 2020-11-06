mvn -f ./br1/pom.xml clean package -DskipTests
mvn -f ./br2/pom.xml clean package -DskipTests

docker network rm pro-network
docker network create --driver bridge pro-network

docker stop br1
docker rm br1
docker rmi br1:latest
docker build -f Dockerfile1 . -t br1
docker run --name br1 --network pro-network -d -p 8081:8080 br1:latest

docker stop br2
docker rm br2
docker rmi br2:latest
docker build -f Dockerfile2 . -t br2
docker run --name br2 --network pro-network -d -p 8082:8080 br2:latest

docker stop prom
docker rm prom
docker run --name prom --network pro-network -d -p 9090:9090 -v /home/test-prothe/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus