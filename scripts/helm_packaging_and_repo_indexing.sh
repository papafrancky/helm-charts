#!/bin/sh

HelmChartsDir="./helm/charts"       # Helm Charts Directory (files)
HelmPackagesDir="./helm/packages"   # Helm packaged Charts (.tgz)

# Package Helm Charts
ChartsList=$( find ${HelmChartsDir} -type d -maxdepth 1 | grep -v ^\.\.helm\/charts$ )
for Chart in $( echo ${ChartsList} ); do
  helm package ${Chart} --destination ./helm/packages
done

# Repo Index
helm repo index ./helm/packages
