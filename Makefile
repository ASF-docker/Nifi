VERSION = 1.0.0
REPOSITORY=apacheimages
PROJECT=nifi

all: build push
	;
	
build: Dockerfile
	docker build -t ${REPOSITORY}/${PROJECT}:${VERSION} .
push:
	docker push ${REPOSITORY}/${PROJECT}:${VERSION}
	
shell:
	docker run -it --rm -p 8080:8080 ${REPOSITORY}/${PROJECT}:${VERSION} /bin/sh

run:
	docker run --rm -p 8080:8080 ${REPOSITORY}/${PROJECT}:${VERSION} 
