FROM wangyuntao/java8
MAINTAINER wangyuntao <wyt.daily@gmail.com>

LABEL usage="docker run wangyuntao/dynamodb-local"

WORKDIR /root

RUN \
  apt-get install -y wget && \
  wget -O - http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz | tar -zxf - -C ./ && \
  mkdir data

CMD ["java", "-Djava.library.path", "./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbth", "./data"]
