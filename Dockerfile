# base images
FROM centos65

# openjdk install
RUN yum -y install which wget &&\
yum -y install java-1.7.0-openjdk

# java_home set
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk.x86_64

# elasticsearch install
RUN cd /opt &&\
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz && \
tar xvzf elasticsearch-1.3.1.tar.gz &&\
rm -f elasticsearch-1.3.1.tar.gz &&\
mv elasticsearch-1.3.1 elasticsearch &&\
cp -p /opt/elasticsearch/config/elasticsearch.yml /opt/elasticsearch/config/ORG.elasticsearch.yml &&\
mkdir /data && chmod 777 /data &&\
echo 'cluster.name: ${CLUSTER_NAME}' >> /opt/elasticsearch/config/elasticsearch.yml &&\
echo 'node.name: ${NODE_NAME}'>> /opt/elasticsearch/config/elasticsearch.yml &&\
echo "path.data: /data" >> /opt/elasticsearch/config/elasticsearch.yml &&\
echo "path.logs: /var/log/elasticsearch/logs" >> /opt/elasticsearch/config/elasticsearch.yml &&\
echo "transport.tcp.port: 9300" >> /opt/elasticsearch/config/elasticsearch.yml &&\
echo "http.port: 9200" >> /opt/elasticsearch/config/elasticsearch.yml &&\
echo "action.auto_create_index: false" >> /opt/elasticsearch/config/elasticsearch.yml &&\
echo "index.mapper.dynamic: false" >> /opt/elasticsearch/config/elasticsearch.yml &&\
/opt/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-kuromoji/2.1.0 &&\
/opt/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ &&\
/opt/elasticsearch/bin/plugin -install mobz/elasticsearch-head &&\
/opt/elasticsearch/bin/plugin -install polyfractal/elasticsearch-inquisitor
