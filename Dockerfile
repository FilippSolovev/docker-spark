FROM debian:10.3

LABEL version="3.0.1"
LABEL description="Spark 3.0.1 on top of JDK11 and Scala 2.13.2"

# Initial
RUN apt-get update && apt-get upgrade -y\
    && apt-get install -y wget

# Install Java 11 JDK
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list \
    && apt-get update \
    && apt-get install -y openjdk-11-jdk

# Install Scala 2.13.2
RUN wget -c www.scala-lang.org/files/archive/scala-2.13.2.deb \
    && dpkg -i scala-2.13.2.deb \
    && apt-get update \
    && apt-get install -y scala \
    && rm scala-2.13.2.deb

# Install sbt
RUN wget -c https://bintray.com/artifact/download/sbt/debian/sbt-1.3.4.deb \
    && dpkg -i sbt-1.3.4.deb \
    && apt-get update \
    && apt-get install sbt \
    && rm sbt-1.3.4.deb

# Install Spark 3.0.1
RUN wget -c https://apache-mirror.rbc.ru/pub/apache/spark/spark-3.0.1/spark-3.0.1-bin-hadoop2.7.tgz \
    && mkdir usr/local/spark \
    && tar -xvzf spark-3.0.1-bin-hadoop2.7.tgz -C /usr/local/spark --strip-components=1 \
    && rm spark-3.0.1-bin-hadoop2.7.tgz \
    && apt-get -y autoremove

ENV PATH=$PATH:/usr/local/spark/bin

# Install python3 and pyspark
RUN apt-get install -y python3

ENV PYSPARK_PYTHON=/usr/bin/python3 \
    PYSPARK_DRIVER_PYTHON=python3

EXPOSE 4040 10000

# cleanup
RUN apt-get -y autoremove

WORKDIR /usr/local/spark/
