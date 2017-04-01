#Development
FROM ubuntu:16.04
MAINTAINER Clint Edwards <clint.j.edwards@gmail.com>

#Install required packages
RUN apt-get update -y && apt-get install -y \
    build-essential \
    python \
    python-pip \
    python-dev \
    python-setuptools \
    nginx \
    vim \
    supervisor \
    uwsgi \
    uwsgi-plugin-python

WORKDIR /var/web

#Install python packages
COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

#Configure nginx
RUN rm /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/conf.d/personal_website.conf
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

#Configure uwsgi
COPY ./uwsgi.ini .

#Configure supervisor
COPY ./supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-n"]
