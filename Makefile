OWNER=win7
NAME=aria2-ui-ng
TAG     ?= v1.0.0


all: image

image:
	docker build --no-cache -t ${OWNER}/${NAME}:${TAG} .

push:
	docker push ${OWNER}/${NAME}:${TAG}
