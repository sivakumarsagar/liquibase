FROM alpine:3.12
WORKDIR /app
ENV LIQUIBASE_HOME /app/
COPY changelog.xml .
COPY scripts .
ENV LIQUIBASE_VERSION=4.17.1
EXPOSE 80
RUN apk add openjdk8-jre &&  mkdir liquibasejarfiles && cd liquibasejarfiles && wget https://github.com/liquibase/liquibase/releases/download/v${LIQUIBASE_VERSION}/liquibase-${LIQUIBASE_VERSION}.tar.gz \
    && tar -xzf liquibase-${LIQUIBASE_VERSION}.tar.gz \
    && ls -l \
    && rm liquibase-${LIQUIBASE_VERSION}.tar.gz && apk add bash && cd /app/liquibasejarfiles && mv liquibase /usr/local/bin && mv internal /app/
#RUN liquibase  --classpath=/app/postgresql-42.5.3.jar --driver=org.postgresql.Driver --url="jdbc:postgresql://database3.cluster-ckyuejuhxwx8.us-east-1.rds.amazonaws.com:5432/db1" --username=postgres --password=password --changeLogFile=./changelog.xml  update
