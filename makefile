build:
	@docker build -t jenkins-master jenkins-master/.

stop:
	@docker kill $$(docker ps -q) || true

clean-containers: stop
	@docker rm $$(docker ps -aq) || true

clean-images: clean-containers
	@docker rmi $$(docker images -q) || true
	

