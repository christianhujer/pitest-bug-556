#!/bin/bash

JAVA_HOME_8=/usr/lib/jvm/java-8-openjdk-amd64/
JAVA_HOME_11=/usr/lib/jvm/java-11-openjdk-amd64/
JAVA_HOME_13=/opt/openjdk-13.0.1/
JAVA_HOME_14=/opt/openjdk-14-ea+25/

javaVersions=(8 11 13 14)
pitestVersions=(1.4.9 1.4.10 1.4.11)

(
  echo "Java,PiTest,Singleton,Utility"
  for javaVersion in "${javaVersions[@]}" ; do
    java_home_name="JAVA_HOME_${javaVersion}"
    export JAVA_HOME="${!java_home_name}"
    for pitestVersion in "${pitestVersions[@]}" ; do
      echo "Generating report for Java ${javaVersion} (${JAVA_HOME}), PiTest version ${pitestVersion}" >&2
      ./mvnw \
        -Dversion.pitest="${pitestVersion}" \
        -Dmaven.compiler.source="${javaVersion}" \
        -Dmaven.compiler.target="${javaVersion}" \
        clean \
        test \
        org.pitest:pitest-maven:mutationCoverage \
        >/dev/null 2>/dev/null
      coverageSingletonEnum=$(grep -A 1 SingletonEnum.java target/pit-reports/*/com.example/index.html | tail -n 1 | grep -oP '\d+%')
      coverageUtilityEnum=$(grep -A 1 UtilityEnum.java target/pit-reports/*/com.example/index.html | tail -n 1 | grep -oP '\d+%')
      echo "${javaVersion},${pitestVersion},${coverageSingletonEnum},${coverageUtilityEnum}"
    done
  done
) >report.csv
