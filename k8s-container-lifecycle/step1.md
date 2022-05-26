

### Run create a pod nginx-lifecycle with lifecycle handler postStart and preStop
```
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: nginx-lifecycle
  spec:
    containers:
    - name: nginx
      image: nginx
      lifecycle:
        postStart:
          exec:
            command:
            - /bin/sh
            - -c
            - echo "$$ $(date); from postStart nginx-lifecycle" >> /proc/1/fd/1
        preStop:
          exec:
            command:
            - /bin/sh
            - -c
            - echo "$$ $(date); from preStop nginx-lifecycle" >> /proc/1/fd/1
EOF
```{{exec}}