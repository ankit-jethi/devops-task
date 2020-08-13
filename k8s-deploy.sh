#!/bin/bash

# Create namespace
kubectl apply -f 01-namespace.yml

# Create deployment
cat > deployment-${BUILD_NUMBER}.yml <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: devops-task-deployment-${BUILD_NUMBER}
  labels:
    app: devops-task
    version: "${BUILD_NUMBER}"
  namespace: devops-task-namespace
spec:
  replicas: 2
  selector:
    matchLabels:
      app: devops-task
      version: "${BUILD_NUMBER}"
  template:
    metadata:
      labels:
        app: devops-task
        version: "${BUILD_NUMBER}"
    spec:
      containers:
      - image: ankitjethi/devops-task:${BUILD_NUMBER}
        name: devops-task
        ports:
        - containerPort: 8000
        readinessProbe:
          httpGet:
            path: /
            port: 8000
          initialDelaySeconds: 10
          timeoutSeconds: 1
          periodSeconds: 10
      restartPolicy: Always
EOF

# Apply deployment
kubectl apply -f deployment-${BUILD_NUMBER}.yml
