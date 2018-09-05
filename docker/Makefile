main:
	docker build -t docker-dev .
	docker run -it -v /var/run/docker.sock:/var/run/docker.sock docker-dev /bin/zsh

publish:
	docker build -t nosnevets/gower-dev-image:version1.0 .
	docker push nosnevets/gower-dev-image:version1.0
