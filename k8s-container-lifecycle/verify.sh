#!/usr/bin/bash
if [[ $(kubectl logs nginx-lifecycle | grep -E -q "from (postStart|preStop) nginx-lifecycle") ]]
then 
  #not found
  exit 1; 
else
  #found
  exit 0;
fi
