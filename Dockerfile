FROM atlassian/bitbucket-server:5.12.2

MAINTAINER "xing.jiudong@trans-cosmos.com.cn"

ENV PLUGIN_PATH ${BITBUCKET_HOME}/shared/plugins/installed-plugins
ENV CONF /var/atlassian/application-data/bitbucket/shared/bitbucket.properties

RUN set -x && echo server.context-path=/bitbucket >> ${CONF}

# Install plugins
RUN set -x && \
  curl -sLo ${PLUGIN_PATH}/sonar4stash-1.7.0.jar https://marketplace-cdn.atlassian.com/files/artifact/71122296-65eb-4067-8be9-fc254b8688b9/sonar4stash-1.7.0.jar && \
  curl -sLo ${PLUGIN_PATH}/workzone-4.2.4.jar https://marketplace-cdn.atlassian.com/files/artifact/d4a90566-5d39-49bb-b2cb-fd5e39836fb3/workzone-4.2.4.jar
