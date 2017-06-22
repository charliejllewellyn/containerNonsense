#!/bin/bash

oc new-build https://github.com/charliejllewellyn/containerNonsense.git

while !(oc logs -f bc/containernonsense | grep 'Push successful' -q); do
  echo waiting for build to complete
  sleep 10
done
