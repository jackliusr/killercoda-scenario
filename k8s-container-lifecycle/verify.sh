#!/usr/bin/bash
kubectl logs nginx-lifecycle | grep -E -q "from (postStart|preStop) nginx-lifecycle"
