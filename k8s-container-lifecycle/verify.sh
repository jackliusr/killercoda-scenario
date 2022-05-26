#!/bin/bash
if kubectl logs nginx-lifecycle | grep -E -q "from (postStart|preStop) nginx-lifecycle" ; 
then 
  exit 1; 
else 
  exit 0;
fi