FROM mysql:5.5

# customized to install ilios demo database
MAINTAINER Jonathan Johnson <jon.johnson@ucsf.edu>
ENV MYSQL_RANDOM_ROOT_PASSWORD yes
ENV MYSQL_USER ilios_user
ENV MYSQL_PASSWORD ilios_pass
ENV MYSQL_DATABASE ilios
RUN apt-get update && apt-get install -y wget

COPY ilios-mysql.cnf /etc/mysql/conf.d/ilios.cnf

COPY ilios-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
