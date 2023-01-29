FROM liquibase/liquibase:4.17
USER root
ENV LIQUIBASE_HOME /liquibase/changelog
WORKDIR $LIQUIBASE_HOME
COPY ./entrypoint.sh $LIQUIBASE_HOME
RUN chmod 777 /liquibase/changelog/entrypoint.sh
COPY changelog.xml /liquibase/changelog
COPY ./scripts/ /liquibase/changelog/scripts/
RUN ls /liquibase/changelog/ &&  mkdir -p /liquibase/changelog/internal/lib/ && cp /liquibase/internal/lib/*.jar /liquibase/changelog/internal/lib/ && liquibase --classpath=/liquibase/internal/lib/liquibase-core.jar --changeLogFile=$LIQUIBASE_HOME/changelog.xml --url=jdbc:postgresql://database3.cluster-ckyuejuhxwx8.us-east-1.rds.amazonaws.com:5432/db1 --username=postgres --password=12345678 update 
