VERSION = 1.0.0
ORGANIZATION=apacheimages
REPOSITORY=nifi

all: build push
	;
	
build: Dockerfile
	docker build -t ${ORGANIZATION}/${REPOSITORY}:${VERSION} .

push:
	#docker push ${ORGANIZATION}/${REPOSITORY}:${VERSION}
	git add Dockerfile
	git push origin ${VERSION}
	
shell:
	docker run --name ${REPOSITORY} -it --rm -p 8080:8080 ${ORGANIZATION}/${REPOSITORY}:${VERSION} /bin/sh

run:
	docker run --name ${REPOSITORY} --rm -p 8080:8080 ${ORGANIZATION}/${REPOSITORY}:${VERSION} 
