FROM postgres:16.15-alpine@sha256:cf78e76683b9ca8c5733cbbdce6c9262b45b6767934dd0a95e671f9a0fc20685

# Need to get coreutils to get the date bash function working properly:
RUN apk add --no-cache coreutils && rm -rf /var/cache/apk/*

# Files for initializing the database.
COPY initdb/0_init_tables.sql initdb/1_create_transactions.sh /docker-entrypoint-initdb.d/
RUN chmod 755  /docker-entrypoint-initdb.d/0_init_tables.sql /docker-entrypoint-initdb.d/1_create_transactions.sh
