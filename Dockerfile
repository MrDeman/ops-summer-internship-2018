FROM macpaw/internship
EXPOSE 80

RUN apt install -y python3 nano logrotate
RUN pip install feedparser
RUN pip install requests
#RUN rm /etc/logrotate.d/*
RUN rm /etc/nginx/conf.d/*
RUN rm /app/*
RUN mkdir -p /var/www/html/ip/

COPY app/main.py /app
COPY app/uwsgi.ini /app

COPY nginx/var/www/html/ip/* var/www/html/ip/
COPY nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

#COPY logrotate/logrotate.conf /etc/logrotate.conf

COPY Unlocker.py /
COPY ip.py /

RUN cd .. && \
    ./Unlocker.py && \
    ./ip.py
