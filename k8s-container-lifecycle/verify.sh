#!/bin/bash
if [[ kubectl logs nginx-lifecycle | grep -E -q "from (postStart|preStop) nginx-lifecycle" ]]
then 
  exit 0; 
else
  exit 1;
fi