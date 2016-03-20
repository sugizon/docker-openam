FROM tomcat:8-jre8

MAINTAINER Mitsumasa Sugimoto <sugimoto@mashbrains.jp>

ENV CATALINA_OPTS="-Xmx2048m -server"

RUN curl -#fL "https://github.com/OpenRock/OpenAM/releases/download/13.0.0/OpenAM-13.0.0.war" -o openam.war && \
cp openam.war $CATALINA_HOME/webapps/openam.war && \
rm openam.war

ADD run-openam.sh /tmp/run-openam.sh

CMD ["/tmp/run-openam.sh"]