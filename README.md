# Apache Spark in Docker

A docker container with Spark 3.0 based on a full Debian image with Java 11 JDK and Scala 2.13.2. It has been created for those who want to learn Spark but do not want to mess their machines up installing Java and Scala.

# Example
To run this docker container and start exploring Apache Spark within the terminal type in the following command:

~~~~
$ docker container run --name spark \
    -p 4040:4040 \
    -p 10000:10000 \
    -it pslv/spark:latest /bin/bash
~~~~

As for any docker container, you can mount a local directory to it. So that files put there are reachable inside the container.
The example below shows mounting a current directory to the 'mnt' folder in '/usr/local/spark/':

~~~~
$ docker container run --name spark \
    -p 4040:4040 \
    -p 10000:10000 \
    -v $(pwd):/usr/local/spark/mnt \
    -it pslv/spark:latest /bin/bash
~~~~

# Build With
* [Docker](https://docker.com)
* [Apache Spark](https://spark.apache.org)

# Author
[Filipp Solovev](https://github.com/FilippSolovev "Filipp Solovev")
