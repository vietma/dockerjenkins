build:
	@docker build -t jenkins-master jenkins-master/.

stop:
	@docker stop $$(docker ps -aq) || true && @docker rm $$(docker ps -aq) || true

clean-containers: stop
	@docker rm $$(docker ps -aq)

clean-images: stop
	@docker rmi $$(docker images -q)

