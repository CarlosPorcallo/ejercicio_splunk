rem ###### Variables de entorno ######
set SPLUNK_PASSWORD=<password>
set CONTAINER_NAME=<splunk>
set DOCKER_IMG="<splunk/splunk:latest>"
set DOCKER_NETWORK="<docker-network>"
rem ###### Variables de entorno ######

docker container stop splunk
docker container rm splunk
docker network create %DOCKER_NETWORK%
docker run -d ^
    --network=%DOCKER_NETWORK% ^
    -p 8000:8000 ^
    -e "SPLUNK_START_ARGS=--accept-license" ^
    -e "SPLUNK_PASSWORD=%SPLUNK_PASSWORD%" ^
    --name %CONTAINER_NAME% ^
    %DOCKER_IMG%
