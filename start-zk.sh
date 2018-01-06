
ZK_VERSION=
if [ -z ${1+x} ]
then
  echo "ERROR: ZK Version not set!!"
  exit 1
else
  ZK_VERSION=$1
fi

sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties
sed -i -r 's|#autopurge|autopurge|g' $ZK_HOME/conf/zoo.cfg

/opt/zookeeper-$ZK_VERSION/bin/zkServer.sh start-foreground
