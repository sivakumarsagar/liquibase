FROM alpine:3.12
WORKDIR /app
COPY changelog.xml .
Run mkdir ./scripts/
COPY scripts ./scripts/
# Install Java, which is required for running Liquibase
RUN apk add openjdk8-jre && java -version && mkdir liquibasejarfiles && cd liquibasejarfiles && wget https://github.com/liquibase/liquibase/releases/download/v4.0.0/liquibase-4.0.0.tar.gz && tar xvzf liquibase-4.0.0.tar.gz && ls -l && export PATH=$PATH:/app/liquibasejarfiles/ &&  wget https://jdbc.postgresql.org/download/postgresql-42.5.3.jar
RUN  java -jar /app/liquibasejarfiles/liquibase.jar --classpath=/app/liquibasejarfiles/postgresql-42.5.3.jar --driver=org.postgresql.Driver --url="jdbc:postgresql://database3.cluster-ckyuejuhxwx8.us-east-1.rds.amazonaws.com:5432/db1" --username=username --password=password --changeLogFile=./changelog.xml  update
