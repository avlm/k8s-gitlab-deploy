Docker image based on official [bitnami/kubectl](https://hub.docker.com/r/bitnami/kubectl) image to use with Gitlab CI for deployment automation.

This image has envsubst that allows you to use ENV variables in your kubernetes yaml files.

Example:

`.gitlab-ci.yaml`
```yaml
deployment:
    stage: deploy
    image:
        name: avlm/k8s-gitlab-deploy:latest
    before_script:
    - export VERSION_TAG=latest
    script:
    - bash deploy.sh
```

`deploy.sh`
```bash
envsubst < deployment-template.yaml > deployment.yaml
kubectl apply -f deployment.yaml
```

`deployment-template.yaml`
```yaml
spec:
    containers:
    - name: example-app
    image: docker/hello-world:${VERSION_TAG}
    imagePullPolicy: Always
```

`deployment.yaml`
```yaml
spec:
    containers:
    - name: example-app
    image: docker/hello-world:latest
    imagePullPolicy: Always
```
