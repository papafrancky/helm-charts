#!/bin/sh

HelmChartsDir="./charts"       # Helm Charts Directory (files)
HelmPackagesDir="./packages"   # Helm packaged Charts (.tgz)

# Package Helm Charts
ChartsList=$( find ${HelmChartsDir} -type d -maxdepth 1 | grep -v ^\.\.helm\/charts$ )
for Chart in $( echo ${ChartsList} ); do
  printf "Packaging the Helm charts ...\n"
  helm package ${Chart} --destination ./helm/packages
done

# Repo Index
printf "Indexing the Helm charts ...\n"
helm repo index ${HelmPackagesDir}
