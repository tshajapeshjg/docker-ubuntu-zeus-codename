
EULA_STUFF="-e MSSQL_PID=Developer -e ACCEPT_EULA=Y -e ACCEPT_EULA_ML=Y "
ddir=/opt/var/lib/mssql/data
mkdir -p $ddir
. .env
mlocation=/data

RUNMODE="run -d"
#dockertag="docker.io/guillaumeai/server:zeuz-mssql-ml-ubuntu-18.04-ssis-py3.7.2-lzma"



dockertag=docker.io/guillaumeai/zeus



containername=zeuzis

if [ "$1" == "--rm" ]; then docker rm -f $containername ;fi

MSSQL_PORTMAP="-p 1433:1433"
#SSIS_PORTMAP="-p 3882:3882"

cmd="docker $RUNMODE $EULA_STUFF --name $containername \
     -e MSSQL_SA_PASSWORD="$SAPWD" \
     -v $ddir:$mlocation -v $(pwd):/work \
     $MSSQL_PORTMAP  \
     $dockertag"

echo "$cmd"
$cmd


