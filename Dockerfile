FROM tutum/lamp

MAINTAINER Daniel Romero <infoslack@gmail.com>

RUN rm -rf /app && \
    apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

COPY conf/* /tmp/

RUN wget https://github.com/RandomStorm/DVWA/archive/v1.0.8.tar.gz && \
    tar xvf /v1.0.8.tar.gz && \
    mv -f /DVWA-1.0.8 /app && \
    rm /app/.htaccess

RUN mv /tmp/.htaccess /app && \
    chmod +x /tmp/setup_db.sh && \
    /tmp/setup_db.sh

RUN sed -i "s/FileInfo/All/g" /etc/apache2/sites-available/000-default.conf

EXPOSE 80 3306

CMD ["/run.sh"]
