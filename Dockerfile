# base images
FROM centos65

# openjdk install
RUN yum -y install which wget &&\
yum -y install java-1.7.0-openjdk

# java_home set
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk.x86_64

# elasticsearch install
RUN yum localinstall -y https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.noarch.rpm &&\
cp -p /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/ORG.elasticsearch.yml &&\
mkdir /data && chmod 777 /data &&\
echo 'cluster.name: ${CLUSTER_NAME}' >> /etc/elasticsearch/elasticsearch.yml &&\
echo 'node.name: ${NODE_NAME}'>> /etc/elasticsearch/elasticsearch.yml &&\
echo "path.data: /data" >> /etc/elasticsearch/elasticsearch.yml &&\
echo "path.logs: /var/log/elasticsearch/logs" >> /etc/elasticsearch/elasticsearch.yml &&\
echo "transport.tcp.port: 9300" >> /etc/elasticsearch/elasticsearch.yml &&\
echo "http.port: 9200" >> /etc/elasticsearch/elasticsearch.yml &&\
echo "action.auto_create_index: false" >> /etc/elasticsearch/elasticsearch.yml &&\
echo "index.mapper.dynamic: false" >> /etc/elasticsearch/elasticsearch.yml &&\
/usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-analysis-kuromoji/2.1.0 &&\
/usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ &&\
/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head &&\
/usr/share/elasticsearch/bin/plugin -install polyfractal/elasticsearch-inquisitor

#RUN /etc/init.d/elasticsearch start &&\


