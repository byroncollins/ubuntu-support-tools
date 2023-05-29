# ubuntu-support-tools
Ubuntu LTS Container with support tools installed for troubleshooting on kubernetes clusters and docker


## Kubernetes

```bash
# In required namespace
kubectl apply -f pod-support-tools.yaml
kubectl exec -it support-tools -- bash
```

## Docker

```bash
docker run --rm -d --name ubuntu-support-tools byroncollins/ubuntu-support-tools:latest"
docker exec -it ubuntu-support-tools bash
```
