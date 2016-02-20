FROM ubuntu:14.04.4
MAINTAINER Dave Oxley <apache-proxy-docker@oxley.email>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        apache2 && \
    	rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy_http ssl

COPY default-ssl.conf /etc/apache2/sites-available/
COPY ports.conf /etc/apache2/
RUN mkdir /etc/apache2/proxy-conf
RUN rm -rf /var/www/html/*

RUN a2ensite default-ssl

EXPOSE 443

CMD ["/usr/sbin/apachectl", "-e", "info", "-DFOREGROUND"]
