#!/bin/bash
if $(kubectl logs nginx-lifecycle | grep -q "from postStart nginx-lifecycle" ) && $(kubectl logs nginx-lifecycle | grep -q "from preStop nginx-lifecycle" ); then exit 1; fi