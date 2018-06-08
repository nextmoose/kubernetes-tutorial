```
minikube start --vm-driver virtualbox &&
    kubectl config use-context minikube &&
    kubectl cluster-info &&
    minikube dashboard &&
    (chromium-browser http://192.168.99.100:30000 &) &&
    
```

```
node server.js &&
    chromium-browser http://localhost:8080/.
```