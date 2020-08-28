FROM jenkins/jenkins:lts

LABEL maintainer="Perumal Varadharajulu"
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#COPY jenkins2.sh /usr/local/bin/jenkins2.sh
#COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
ENV JENKINS_HOME /var/jenkins_home
#ENV CASC_JENKINS_CONFIG=/var/jenkins_home/jenkins.yaml

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
