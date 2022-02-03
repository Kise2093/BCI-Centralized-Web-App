#Deploy gitlab https://gitlab.com/gitlab-org/charts/gitlab/-/blob/master/doc/installation/deployment.md


helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.edition=ce \
  --set global.hosts.domain=example.com \
  --set global.hosts.externalIP=10.10.10.10 \
  --set certmanager-issuer.email=kris@iknowplus.co.th


helm status gitlab

#Steps after installation https://docs.gitlab.com/ee/install/next_steps.html
#Setup runners
#Gitlab Pages
#Gitlab Registry
#Gitlab Dependency Proxy