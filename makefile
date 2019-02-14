build:
	@docker build -t jenkins-master jenkins-master/.
stop:
	@docker stop jenkins-master
clean: stop
	@docker rm jenkins-master

clean-images:
	@docker rmi $$(docker images -q)

