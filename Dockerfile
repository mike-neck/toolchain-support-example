FROM library/ubuntu:20.04

RUN \
  apt-get update -y && \
  apt-get install -q -y curl zip unzip && \
  (curl -s "https://get.sdkman.io" | bash) && \
  /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk i  java 8.0.275-amzn" && \
  mkdir /work

WORKDIR /work

COPY run.sh build.gradle settings.gradle gradlew /work/
COPY src /work/src
COPY gradle /work/gradle

CMD ["./run.sh"]
