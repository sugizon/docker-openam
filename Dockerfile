FROM tomcat:8-jre8

MAINTAINER Mitsumasa Sugimoto <sugimoto@mashbrains.jp>

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV CATALINA_OPTS="-Xmx1024m -server"
WORKDIR $CATALINA_HOME

EXPOSE 8080

RUN wget https://github.com/OpenRock/OpenAM/releases/download/13.0.0/OpenAM-13.0.0.zip && \
unzip *.zip && \
mv openam/*.war webapps/openam.war && \
rm *.zip

ADD run-openam.sh /tmp/run-openam.sh

CMD ["/tmp/run-openam.sh"]