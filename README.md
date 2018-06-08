# Kubernetes Hello World Tutorial
This is a containerized version of the Kubernetes Hello World tutorial available at https://kubernetes.io/docs/tutorials/hello-minikube/.

## Getting Started

### Prerequisites
The goal of this project is that there should be no prerequisites other than Docker.
For various reasons, I doubt that this works on non-linux systems, but I don't know that
it does not work on Mac or Windows, so go ahead and give it a try.

### Installing
Run `build.sh`.
This will build the image locally on your system.

### First Time Usage
1. Use the `create-volume.sh` script to create a persistent storage volume.
This is important because the minikube iso will take a while to download.
If you do not use a persistent storage volume then you will have to download
the iso file ever time repeatedly.
2. Use the `create-container.sh` script to create a container.

### Regular Usage
1. Run `docker container start --interactive kubernetes-tutorial` to start the container.
2. You will get a shell script from which you can execute commands in the context of the container.

### From inside the container
1. Open your browser `chromium-browser --no-sandbox`.
2. Create a minikube cluster.  Execute these commands
```
minikube start --vm-driver virtualbox &&
    kubectl config use-context minikube &&
    kubectl cluster-info &&
    minikube dashboard --url
```
Then visit the page referenced in the dashboard output. 

3. Create your node application.  Run
```
node server.js
```
and visit http://localhost:8080.  Then kill the node application by Ctrl-S.

4. Create a Docker Image
```
eval $(minikube docker-env --shell sh) &&
    docker build -t hello-node:v1
```
5. Create a Deployment
```
kubectl run hello-node --image=hello-node:v1 --port=8080 &&
    kubectl get deployments &&
    kubectl get pods &&
    kubectl get events &&
    kubectl config view
```
6. Create a Service
```
kubectl expose deployment hello-node --type=LoadBalancer &&
    kubectl get services &&
    minikube service hello-node
```
Then visit the page referenced in the dashboard output.

7. Update your app.
```
emacs server.js &&
    docker build -t hello-node:v2 . &&
    kubectl set image deployment/hello-node hello-node=hello-node:v2
```
Now reload the page.  You should see your changes.
8. Addons.  You can try them out see https://kubernetes.io/docs/tutorials/hello-minikube/#enable-addons
9. Cleanup.  You can clean things up if you like https://kubernetes.io/docs/tutorials/hello-minikube/#clean-up, but you don't have to.  Remember everything is running in a container.  When you are tired of it, you can stop and remove the container.
```
docker container rm --force kubernetes-tutorial &&
    docker volume rm kubernetes-tutorial
```
 


