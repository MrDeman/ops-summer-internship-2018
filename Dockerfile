FROM macpaw/internship

EXPOSE 80/tcp

COPY entrypoint.sh /

#RUN apt install -y python3 nano logrotate
#RUN pip install feedparser requests flask

RUN mkdir -p etc/logrotate.d/

COPY app /app
COPY nginx/nginx.conf /etc/nginx/conf.d/nginx.conf
#RUN chmod 0644 /etc/logrotate.d/logrotate.conf
COPY logrotate/logrotate.conf /etc/logrotate.d/logrotate.conf
#RUN logrotate -d /etc/logrotate.d/ ; logrotate -v -f /etc/logrotate.d/

#RUN cd .. && \
#    echo ** ** ** && \        
#    ./app/Unlocker.py && \
#    echo ** ** ** && \
#    ./app/ip.py

ENTRYPOINT ["/entrypoint.sh"]
