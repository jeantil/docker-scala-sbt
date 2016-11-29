FROM openjdk:jdk
MAINTAINER Jean Helou <jean@gmél.com>
ENV SCALA_VERSION 2.11.8
ENV SBT_VERSION 0.13.13
ENV SBT_OPTS -Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xss2M -Duser.timezone=GMT
# install sbt
RUN wget https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  wget https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb && \
  dpkg -i scala-$SCALA_VERSION.deb
VOLUME /root/.ivy2
VOLUME /src
WORKDIR /src
