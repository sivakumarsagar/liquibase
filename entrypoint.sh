#!/bin/bash

if [ "$1" = "update" ]; then
    liquibase \
        --classpath=$LIQUIBASE_HOME/lib \
        --changeLogFile=$LIQUIBASE_HOME/changelog.xml \
        --url=$LIQUIBASE_URL \
        --username=$LIQUIBASE_USERNAME \
        --password=$LIQUIBASE_PASSWORD \
        update
elif [ "$1" = "status" ]; then
    liquibase \
        --classpath=$LIQUIBASE_HOME/lib \
        --changeLogFile=$LIQUIBASE_HOME/changelog.xml \
        --url=$LIQUIBASE_URL \
        --username=$LIQUIBASE_USERNAME \
        --password=$LIQUIBASE_PASSWORD \
        status
else
    echo "Invalid command"
    exit 1
fi

