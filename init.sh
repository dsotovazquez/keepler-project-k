MYSQL_ROOT_PASSWORD=$1
SAMPLE_DATABASE="classicmodels"

MYSQL_ROOT_PASSWORD=$(cat stack.yaml |grep MYSQL_ROOT_PASSWORD|tr -d ' '|cut -d ':' -f 2)

if [ -z ${MYSQL_ROOT_PASSWORD} ]
then
 echo "Mysql Database password missing"
 exit 1
fi

curl https://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip|bsdtar -xvf-

# MySQL Database

docker swarm init
docker stack deploy -c stack.yaml mysql
sleep 10

IMAGE_ID=$(docker ps|grep mysql:latest|tr -s ' '|cut -d ' ' -f 1)
docker exec -i ${IMAGE_ID} /bin/sh -c 'exec mysql -uroot -p"${MYSQL_ROOT_PASSWORD}"' < mysqlsampledatabase.sql

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h 127.0.0.1 ${SAMPLE_DATABASE} -e 'show databases;'
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -h 127.0.0.1 ${SAMPLE_DATABASE} -e 'select * from customers;'

# Python

docker build -t python.hackerearth.com -f Dockerfile_python .
echo "Python version:"
docker run -i  python.hackerearth.com -c 'python --version'

# Java

docker build -t  java.hackerearth.com -f Dockerfile_java .
echo "Java version:"
docker run -it  java.hackerearth.com -c 'java --version'

# NodeJS

docker pull mhart/alpine-node-auto:10.15.3 -t nodejs.hackerearth.com
echo "Nodejs version:"
docker run -it mhart/alpine-node-auto:10.15.3 /bin/sh -c 'node --version'
