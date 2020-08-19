# DevOps Task
CI/CD pipeline with Jenkins & Kubernetes

### Steps:
1. Imported the sample app repository to GitHub.
2. Created 2 EC2 instances (Chose smaller instances for demo purposes) -  
**t3a.micro** - Jenkins + Docker  
**t3a.small** - Kubernetes (microk8s) + Application
3. Then, installed all the tools.
4. Created the [Dockerfile](../master/Dockerfile) - Used the Dockerfile for the build process for a consistent environment. 
Built the docker image on **python:3.8.5-alpine3.12** and pushed it to [Docker Hub.](https://hub.docker.com/r/ankitjethi/devops-task)
5. Started creating the [Jenkinsfile](../master/Jenkinsfile).
Installed **Docker Pipeline** plugin for ease of use with pushing the image to Docker Hub.
6. Setup **webhook** for triggering Jenkins build on commit.
7. Then for the k8s deployment - 
Installed kubectl on the Jenkins server and setup authentication using the **kubeconfig** file. (Opened port for k8s api server - `16443/tcp`)
8. Created yml files for namespace, service & deployment resources.
9. Then for the Blue-green deployment - 
- Changed the deployment process - with a [script](../master/k8s-deploy.sh) that creates the [namespace,](../master/01-namespace.yml) and the deployment resource with the **current Jenkins build number**  & with a readiness probe.
- Then it waits for user input for switching the [service](../master/service.yml) resource to the latest deployment.
- And then finally, waits for user input again before deleting the previous deployment.


### Sources:

#### Docker:

1. [Dockerfile Best Practices](https://www.youtube.com/watch?v=JofsaZ3H1qM&t=1322s)
2. [Docker credentials store](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)

#### Kubernetes:

1. [Microk8s](https://microk8s.io/)
2. [Blue/Green Deployments on Kubernetes](https://www.ianlewis.org/en/bluegreen-deployments-kubernetes)
3. [Labels and Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
4. [Define readiness probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes)

#### Other:

1. [Gunicorn server docs](https://docs.gunicorn.org/en/latest/index.html)
2. [pass](https://www.passwordstore.org)
