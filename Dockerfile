From ubuntu

RUN apt-get -y update && apt-get install -y curl apparmor

RUN curl -fSL -o mysql-router.deb 	http://dev.mysql.com/get/Downloads/MySQL-Router/mysql-router_2.0.3-1ubuntu14.04_amd64.deb

RUN dpkg -i mysql-router.deb

COPY docker-entrypoint /entrypoint.sh

RUN cat /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

RUN /entrypoint.sh

RUN cat /opt/router.ini

EXPOSE 7001 7002

CMD ["/usr/sbin/mysqlrouter", "--extra-config=/opt/router.ini"]

