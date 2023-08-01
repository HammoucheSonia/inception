
FROM mariadb:latest
RUN apt-get update && apt-get install -y mariadb-server
COPY requirements/mariadb/conf/mysql.conf /etc/mysql/my.cnf
EXPOSE 3306
CMD ["mysqld"]
