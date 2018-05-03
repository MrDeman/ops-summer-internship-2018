FROM macpaw/internship
WORKDIR /
EXPOSE 80/tcp

RUN apt install -y python3 nano logrotate
RUN pip install feedparser requests flask

COPY entrypoint.sh /

RUN mkdir -p etc/logrotate.d/

COPY app /app
COPY nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY logrotate/logrotate.conf /etc/logrotate.d/logrotate.conf

ENTRYPOINT ["/entrypoint.sh"]
