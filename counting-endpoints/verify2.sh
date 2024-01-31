#!/bin/bash

NUM_EP=$(kubectl get ep -o json | jq '.items | length')

if [ "$NUM_EP" -eq "2" ]; then
    exit 0
else
    exit 1
fi