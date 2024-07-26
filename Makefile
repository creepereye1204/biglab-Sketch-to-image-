.PHONY: init
init:
	sudo dockerd -H tcp://210.94.252.178

.PHONY: all
all: push commit

.PHONY: push
push:
	CONTAINER_ID=$$(docker -H tcp://210.94.252.178 ps -q); \
	docker -H tcp://210.94.252.178 cp /home/smalllab/Desktop/doodle2img $$CONTAINER_ID:/opt

.PHONY: commit
commit:
	CONTAINER_ID=$$(docker -H tcp://210.94.252.178 ps -q); \
	docker -H tcp://210.94.252.178 commit $$CONTAINER_ID creepereye12/apple:0.1

.PHONY: conn
conn:
	CONTAINER_ID=$$(docker -H tcp://210.94.252.178 ps -q); \
	docker -H tcp://210.94.252.178 exec -it $$CONTAINER_ID bash

.PHONY: run-server
run-server:
    docker -H tcp://210.94.252.178 run -d -it --network host --gpus all creepereye12/apple:0.1 bash