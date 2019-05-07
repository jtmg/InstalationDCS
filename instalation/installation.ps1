
# enable running local scripts
set-executionpolicy remotesigned -scope currentuser

# path from utils file
$currentPAth = $PSScriptRoot.ToString() + "\Utils.ps1"
# import utils
.$currentPAth

InitScoop 
#Install-Program ("eclipse-java")
Install-Program ("heidisql")
Install-Program ("robo3t")
#Install-Program ("maven")

#docker login -u admin -p admin123 34.250.203.252:8082
#docker login -u admin -p admin123 34.250.203.252:8083
docker pull 34.249.195.60:8082/mysql
docker pull 34.249.195.60:8082/mongo

docker run --name mysql -d -it -p 3306:3306 34.249.195.60:8083/mysql
docker run --name mongo -d -it -p 27017:27017 34.249.195.60:8083/mongo