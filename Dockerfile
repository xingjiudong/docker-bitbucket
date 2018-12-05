FROM atlassian/bitbucket-server:5.12.2

MAINTAINER "xing.jiudong@trans-cosmos.com.cn"

# update openjdk
RUN set -x \
        && apk del openjdk8

ENV JAVA_VERSION 8u181
ENV JAVA_ALPINE_VERSION 8.181.13-r0

RUN set -x \
        && apk add --no-cache \
                openjdk8="$JAVA_ALPINE_VERSION" \
        && [ "$JAVA_HOME" = "$(docker-java-home)" ]

# install plugins
ENV TEMPLATES_VERSION=3.1.5 \
    TEMPLATES_RAN=9b15b166-4ff0-4e6b-b597-acfacb0dc242 \
    BRANCH_AUTHOR_VERSION=2.1.0 \
    BRANCH_AUTHOR_RAN=e7615d12-4bcb-4148-9f32-db9d188c5b21 \
    PARAMETERIZED_BUILDS_VERSION=3.2.6 \
    PARAMETERIZED_BUILDS_RAN=37c7bb53-1180-4fdf-ad2b-c65397b5541f \
    PULL_REQUEST_VERSION=3.24 \
    PULL_REQUEST_RAN=5a7bc325-0e50-44d7-b688-772c8b8349c1 \
    RIGHTREPO_VERSION=1.0.8 \
    RIGHTREPO_RAN=7ab21fed-0920-4439-bb7c-366cfb051641 \
    SONAR4STASH_VERSION=2.2.2 \
    SONAR4STASH_RAN=ae8270e3-94bb-4be2-9a38-9c359c389f84 \
    STASH_ALL_VERSION=1.8 \
    STASH_ALL_RAN=094910ee-9b83-4502-8c55-8b6a00ee9807 \
    STASH_REMINDERS_VERSION=5.0.2 \
    STASH_REMINDERS_RAN=36e010a8-6928-470c-bfb2-104dcec71179 \
    STASH_WEBHOOH_JENKINS_VERSION=4.0.0 \
    STASH_WEBHOOH_JENKINS_RAN=468414d4-1dc8-4f45-b445-e88a106f63ef \
    WORKZONE_VERSION=5.7.0 \
    WORKZONE_RAN=45a7846b-0d90-4f07-a8b9-ca4f1d97e52e \
    YACC_VERSION=1.19 \
    YACC_RAN=68e8f78c-1765-4035-8c79-11426a743f73

ENV DOWNLOAD_URL=https://marketplace-cdn.atlassian.com/files/artifact \
    PLUGIN_PATH=/tmp

RUN set -x && \
    curl -sLo ${PLUGIN_PATH}/templates-${TEMPLATES_VERSION}.jar                              ${DOWNLOAD_URL}/${TEMPLATES_RAN}/templates-${TEMPLATES_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/bitbucket-branch-author-${BRANCH_AUTHOR_VERSION}.jar            ${DOWNLOAD_URL}/${BRANCH_AUTHOR_RAN}/bitbucket-branch-author-${BRANCH_AUTHOR_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/parameterized-builds-${PARAMETERIZED_BUILDS_VERSION}.jar        ${DOWNLOAD_URL}/${PARAMETERIZED_BUILDS_RAN}/parameterized-builds-${PARAMETERIZED_BUILDS_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/pull-request-notifier-for-bitbucket-${PULL_REQUEST_VERSION}.jar ${DOWNLOAD_URL}/${PULL_REQUEST_RAN}/pull-request-notifier-for-bitbucket-${PULL_REQUEST_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/rightrepo-${RIGHTREPO_VERSION}.jar                              ${DOWNLOAD_URL}/${RIGHTREPO_RAN}/rightrepo-${RIGHTREPO_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/sonar4stash-${SONAR4STASH_VERSION}.jar                          ${DOWNLOAD_URL}/${SONAR4STASH_RAN}/sonar4stash-${SONAR4STASH_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/stash-all-pull-requests-${STASH_ALL_VERSION}.jar                ${DOWNLOAD_URL}/${STASH_ALL_RAN}/stash-all-pull-requests-${STASH_ALL_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/stash-reminders-${STASH_REMINDERS_VERSION}.jar                  ${DOWNLOAD_URL}/${STASH_REMINDERS_RAN}/stash-reminders-${STASH_REMINDERS_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/stash-webhook-jenkins-${STASH_WEBHOOH_JENKINS_VERSION}.jar      ${DOWNLOAD_URL}/${STASH_WEBHOOH_JENKINS_RAN}/stash-webhook-jenkins-${STASH_WEBHOOH_JENKINS_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/workzone-${WORKZONE_VERSION}.jar                                ${DOWNLOAD_URL}/${WORKZONE_RAN}/workzone-${WORKZONE_VERSION}.jar && \
    curl -sLo ${PLUGIN_PATH}/yacc-${YACC_VERSION}.jar                                        ${DOWNLOAD_URL}/${YACC_RAN}/yacc-${YACC_VERSION}.jar
