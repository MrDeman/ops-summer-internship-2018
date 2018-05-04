FROM macpaw/internship

EXPOSE 80/tcp

RUN apt install -y python3 nano logrotate
RUN pip install feedparser flask requests

RUN mkdir -p /etc/logrotate.d/

COPY app /app
RUN cp /var/log/nginx/old.log /app
COPY nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY logrotate/logrotate.conf /etc/logrotate.d/logrotate.conf
RUN chmod 644 /etc/logrotate.d/logrotate.conf && \
    logrotate -v -f /etc/logrotate.d/

COPY Unlocker.py /

RUN /Unlocker.py && \
    /app/ip.py

