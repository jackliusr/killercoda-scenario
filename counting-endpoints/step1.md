

### Run create a pod demo and a demo service

1. A pod demo has two containers: an app (image: stefanprodan/podinfo:6.2.2) and an NGINX proxy.

1. The app exposes an API on port 8080 and a web UI on port 8081.
1. The proxy listens for connections on port 3000 and forwards them to the app on port 8080.
1. The service routes traffic to ports 9000 and 8080 on the pod.

<details><summary>Solution</summary>
<br>

```plain
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: demo
  labels:
    app: demo
spec:
  containers:
  - name: app
    image: stefanprodan/podinfo:6.2.2
    ports:
    - containerPort: 8080
    - containerPort: 8081
  - name: proxy
    image: nginx
    ports:
    - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: demo
spec:
  selector:
    app: demo
  ports:
    - name: one
      port: 8080
      targetPort: 8080
    - name: metrics
      port: 9000
      targetPort: 9000
EOF
```{{exec}}

</details>
