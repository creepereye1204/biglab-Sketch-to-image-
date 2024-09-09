.PHONY: init
init:
	sudo dockerd -H tcp://$$ip

.PHONY: all
all: push commit

.PHONY: push
push:
	CONTAINER_ID=$$(docker -H tcp://$$ip ps -q); \
	docker -H tcp://$$ip cp /home/smalllab/Desktop/doodle2img $$CONTAINER_ID:/opt

.PHONY: commit
commit:
	CONTAINER_ID=$$(docker -H tcp://$$ip ps -q); \
	docker -H tcp://$$ip commit $$CONTAINER_ID creepereye12/apple:0.1

.PHONY: conn
conn:
	CONTAINER_ID=$$(docker -H tcp://$$ip ps -q); \
	docker -H tcp://$$ip exec -it $$CONTAINER_ID bash

.PHONY: run-server
run-server:
    docker -H tcp://$$ip run -d -it --network host --gpus all creepereye12/apple:0.1 bash
