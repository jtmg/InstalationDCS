
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



docker run --name mysql -d -it -p 3306:3306 asseco/mysql
docker run --name mongo -d -it -p 27017:27017 asseco/mongo