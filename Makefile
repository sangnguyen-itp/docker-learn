ifndef env
	env=stag
endif

build-image:
ifdef env
	cd $(GOPATH)/src/docker-for-learn && \
    docker build -t docker-for-learn:lastest \
    	-f Dockerfile \
    	--build-arg ENV=$(env) \
    	--build-arg PORT=$(shell ./port.sh ${env}) \
    	.
else
	echo 'No env and port'
endif

old_container=$(shell docker ps -a -q --filter="name=docker-for-learn" || '')
clear:
	docker stop ${old_container} && \
	docker rm ${old_container}


run:
ifdef env
	docker run -d -p $(shell ./port.sh ${env}):$(shell ./port.sh ${env}) --name docker-for-learn docker-for-learn:lastest
endif

health-check:
	curl --request GET -sL \
	     --url 'http://localhost:$(shell ./port.sh ${env})/ping'


