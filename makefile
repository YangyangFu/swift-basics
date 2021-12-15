IMA_NAME = yangyangfu/swift
TAG = latest

build:
	docker build --no-cache --rm -t ${IMA_NAME} .

remove_image:
	docker rmi ${IMA_NAME}

push:
	docker push ${IMA_NAME}:latest