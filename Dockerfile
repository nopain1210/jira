FROM atlassian/jira-software:8.20.3-ubuntu-jdk11

ARG AGENT_VERSION=1.3.1

ENV AGENT_PATH=/var/agent \
    AGENT_FILENAME=atlassian-agent.jar \
    AGENT_TARBALL=atlassian-agent.tar.gz

ENV JAVA_OPTS="-javaagent:${AGENT_PATH}/${AGENT_FILENAME} ${JAVA_OPTS}"

RUN mkdir -p ${AGENT_PATH}
COPY ./atlassian-agent-v${AGENT_VERSION}.jar ${AGENT_PATH}/${AGENT_FILENAME}

COPY ./mysql-connector-java-8.0.27.jar ${JIRA_INSTALL_DIR}/lib

RUN chown -R ${RUN_USER}:${RUN_GROUP} ${AGENT_PATH} 
