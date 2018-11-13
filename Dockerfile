FROM atlassian/bitbucket-server:5.12.2

MAINTAINER "xing.jiudong@trans-cosmos.com.cn"

ENV TEMPLATES_VERSION=2.0.3 \
    BRANCH_AUTHOR_VERSION=2.1.0 \
    PARAMETERIZED_BUILDS_VERSION=2.3.0 \
    PULL_REQUEST_VERSION=2.21 \
    RIGHTREPO_VERSION=1.0.6 \
    SONAR4STASH_VERSION=1.7.0 \
    STASH_ALL_VERSION=1.6 \
    STASH_REMINDERS_VERSION=2.0.2 \
    STASH_WEBHOOH_JENKINS_VERSION=3.0.1 \
    WORKZONE_VERSION=5.7.0 \
    YACC_VERSION=1.11 

ENV DOWNLOAD_URL=https://marketplace-cdn.atlassian.com/files/artifact \
    PLUGIN_PATH=/opt/atlassian/bitbucket/app/WEB-INF/atlassian-bundled-plugins

RUN set -x && \
    curl -sLo ${PLUGIN_PATH}/templates-${TEMPLATES_VERSION}.jar                              ${DOWNLOAD_URL}/06d269df-6cdb-4f09-bf37-ba8f1020435f/templates-${TEMPLATES_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/bitbucket-branch-author-${BRANCH_AUTHOR_VERSION}.jar            ${DOWNLOAD_URL}/e7615d12-4bcb-4148-9f32-db9d188c5b21/bitbucket-branch-author-${BRANCH_AUTHOR_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/parameterized-builds-${PARAMETERIZED_BUILDS_VERSION}.jar        ${DOWNLOAD_URL}/8ce82345-b919-4636-88c8-9a8a28307a99/parameterized-builds-${PARAMETERIZED_BUILDS_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/pull-request-notifier-for-bitbucket-${PULL_REQUEST_VERSION}.jar ${DOWNLOAD_URL}/90edc710-654c-4d1e-bd78-1df8a6601f93/pull-request-notifier-for-bitbucket-${PULL_REQUEST_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/rightrepo-${RIGHTREPO_VERSION}.jar                              ${DOWNLOAD_URL}/7d4867ff-c436-4595-869d-2b4cf5856b2b/rightrepo-${RIGHTREPO_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/sonar4stash-${SONAR4STASH_VERSION}.jar                          ${DOWNLOAD_URL}/71122296-65eb-4067-8be9-fc254b8688b9/sonar4stash-${SONAR4STASH_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/stash-all-pull-requests-${STASH_ALL_VERSION}.jar                ${DOWNLOAD_URL}/619bbbcc-651d-47f9-b2f0-0af752bcb8a9/stash-all-pull-requests-${STASH_ALL_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/stash-reminders-${STASH_REMINDERS_VERSION}.jar                  ${DOWNLOAD_URL}/8a0f9137-5bc0-49ec-bf48-3cee3d953ede/stash-reminders-${STASH_REMINDERS_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/stash-webhook-jenkins-${STASH_WEBHOOH_JENKINS_VERSION}.jar      ${DOWNLOAD_URL}/36da8ee6-88e2-441c-9d66-36870a81fe20/stash-webhook-jenkins-${STASH_WEBHOOH_JENKINS_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/workzone-${WORKZONE_VERSION}.jar                                ${DOWNLOAD_URL}/d4a90566-5d39-49bb-b2cb-fd5e39836fb3/workzone-${WORKZONE_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/yacc-${YACC_VERSION}.jar                                        ${DOWNLOAD_URL}/aa2bd0e3-00f2-4ac5-a190-9a8f85530e04/yacc-${YACC_VERSION}.jar
