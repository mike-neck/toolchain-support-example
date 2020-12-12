#!/usr/bin/env bash

source /root/.sdkman/bin/sdkman-init.sh

which sdk

echo "${JAVA_HOME}"
java -version

sed -i 's/AZUL/AMAZON/g' build.gradle

./gradlew -q javaToolchains

./gradlew check --continue --info --stacktrace

./gradlew -q javaToolchains
