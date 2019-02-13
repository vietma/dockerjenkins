build:
	@docker build -t jenkins-master jenkins-master/.
stop:
	@docker stop jenkins-master
clean: stop
	@docker rm jenkins-master
clean-containers:
	@docker rm $(docker ps -a -q)
clean-images: clean-containers
	@docker rmi $(docker images -q)

