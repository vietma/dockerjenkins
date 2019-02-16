FROM centos:7

RUN yum clean all

RUN yum install -y \
    java-1.8.0-openjdk \
    git \
    dos2unix && \
    yum clean all

# SET Jenkins Environment Variables
ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000
ENV JENKINS_VERSION 2.164

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

RUN mkdir -p /usr/share/jenkins

# Install Jenkins
RUN curl -fL http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war -o /usr/share/jenkins/jenkins.war

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log  --webroot=/var/cache/jenkins/war"

# Skip setup wizard
#ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
# run this command
# $java -jar -Djenkins.install.runSetupWizard=false jenkins.war


# Prep Jenkins Directories
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

# Expose Ports for web and slave agents
EXPOSE 8080
EXPOSE 50000

ENTRYPOINT [ "java", "-jar", "/usr/share/jenkins/jenkins.war" ]

