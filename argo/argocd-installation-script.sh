#https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argo argo/argo-cd