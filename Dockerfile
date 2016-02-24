FROM phusion/baseimage:0.9.18
MAINTAINER Dave Oxley <apache-proxy-docker@oxley.email>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        apache2

RUN a2enmod proxy_http ssl

COPY default-ssl.conf /etc/apache2/sites-available/
COPY ports.conf /etc/apache2/
RUN mkdir /etc/apache2/proxy-conf
RUN rm -rf /var/www/html/*
COPY index.html /var/www/html/

RUN a2ensite default-ssl

RUN mkdir /etc/service/apache2
ADD apache2.sh /etc/service/apache2/run

EXPOSE 443

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
