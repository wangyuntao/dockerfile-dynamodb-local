FROM wangyuntao/java8
MAINTAINER wangyuntao <wyt.daily@gmail.com>

ENV DYNAMODB_LOCAL_DIR /root/dynamodb-local

LABEL usage="docker run -d -p 8000:8000 --restart=always --name dynamodb-local -v `pwd`/data:$DYNAMODB_LOCAL_DIR/data wangyuntao/dynamodb-local"

WORKDIR $DYNAMODB_LOCAL_DIR

RUN \
  apt-get install -y wget && \
  wget -O - http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | tar -zxf - -C ./

EXPOSE 8000
VOLUME ["$DYNAMODB_LOCAL_DIR/data"]

CMD ["/usr/bin/java", "-Djava.library.path", "./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbth", "./data"]
