#Variebles
CONTAINER = internship
IMAGE   = macpaw/$(CONTAINER)

default: build run exec

## Usage: make [target]

.PHONY:  help
help:           ## Show help
	 @fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY:  build
build:		## Build image
	 @docker build --tag $(IMAGE) .

.PHONY:  run
run:      	## Run image for listening port 80, and host listening on 80
	 @docker run --publish 80:80 --name $(CONTAINER) --detach $(IMAGE)

.PHONY:  exec
exec: 		## Open in image terminal after run
	 @docker exec --interactive --tty $(CONTAINER) /bin/bash

.PHONY:  rm
rm: 		## Remove container localy
	 @docker rm --force $(CONTAINER)

.PHONY: start
start:		##(Debug) Start $(CONTAINER)
	 @docker start --attach $(CONTAINER) /bin/bash

.PHONY:  stop
stop: 		##(Debug) Stop current container process after 5 seconds after it was close
	 @docker stop --time 5 $(CONTAINER)

.PHONY:  logs
logs: 		##(Debug) Show container's logs
	 @docker logs $(CONTAINER)

.PHONY: author
author:		## Download info about author (pdf from Google Drive)
	 @curl -L -o authorinfo.pdf "https://drive.google.com/uc?export=download&id=1AXFj60uGDEZvRfMs35-kLhYU9YEDvTVd"
