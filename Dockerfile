FROM macpaw/internship

EXPOSE 80/tcp

RUN apt install -y python3 nano logrotate
RUN pip install feedparser
RUN pip install requests
RUN pip install flask

RUN rm -rf /etc/logrotate.d/* /app/main.py /app/uwsgi.ini /etc/nginx/conf.d/*

RUN mkdir -p et/logrotate.d/

COPY app/main.py /app
COPY app/uwsgi.ini /app
COPY app/index.html /app
COPY app/ip.py /app

COPY nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY logrotate/logrotate.conf /etc/logrotate.d/logrotate.conf
RUN logrotate -d /etc/logrotate.d/ ; logrotate -v -f /etc/logrotate.d/

COPY Unlocker.py /

RUN cd .. && \
    echo ** ** ** && \        
    ./Unlocker.py && \
    echo ** ** ** && \
    ./app/ip.py
