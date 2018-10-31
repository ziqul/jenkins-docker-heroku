# FROM jenkins/jenkins:lts
FROM jenkinsci/blueocean
# RUN /usr/local/bin/install-plugins.sh gitlab-plugin publish-over-dropbox
ENV JAVA_OPTS -Xms256m -Xmx512m
ENTRYPOINT []
CMD /sbin/tini -s -- /usr/local/bin/jenkins.sh --httpPort=$PORT
