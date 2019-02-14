build:
	@docker build -t jenkins-master jenkins-master/.

stop:
	@docker kill $$(docker ps -q)

clean-containers: stop
	@docker rm $$(docker ps -aq)

clean-images: clean-containers
	@docker rmi $$(docker images -q)

