#Deploy gitlab https://gitlab.com/gitlab-org/charts/gitlab/-/blob/master/doc/installation/deployment.md


helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm -n gitlab upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.edition=ce \
  --set global.hosts.domain=gitlab.bci.ikp.com \
  --set global.hosts.externalIP=10.1.0.150 \
  --set certmanager-issuer.email=kris@iknowplus.co.th


helm status gitlab

helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --set global.edition=ce \
  --set global.hosts.domain=example.com \
  #--set global.hosts.externalIP=10.10.10.10 \
  #--set certmanager-issuer.email=kris@iknowplus.co.th
  --set global.ingress.configureCertmanager=false

#Steps after installation https://docs.gitlab.com/ee/install/next_steps.html
#Setup runners
#Gitlab Pages
#Gitlab Registry
#Gitlab Dependency Proxy

helm upgrade --install -n gitlab gitlab gitlab/gitlab \
  --set global.edition=ce \
  --set global.hosts.domain=bci.ikp.com \
  --set certmanager-issuer.email=kris@gmail.com \
  --set nginx-ingress.enabled=false \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt

helm -n gitlab install gitlab gitlab/gitlab \
  --set certmanager.install=false \
  --set global.ingress.configureCertmanager=false \
  --set certmanager-issuer.email=kris@iknowplus.co.th \
  --set global.hosts.domain=bci.ikp.com \
  --set global.ingress.annotations."kubernetes\.io/tls-acme"=true \
  --set global.ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt \
  --set gitlab.webservice.ingress.tls.secretName=gitlab-gitlab-tls \
  --set registry.ingress.tls.secretName=gitlab-registry-tls \
  --set minio.ingress.tls.secretName=gitlab-minio-tls \
  --set gitlab-runner.install=false \
  --set nginx-ingress.enabled=false

helm upgrade --install --namespace gitlab gitlab-runner gitlab/gitlab-runner \
  --set gitlabUrl=https://gitlab.bci.iknowplus.co.th,runnerRegistrationToken=fpaqXfVQzcKQ6zWBsmA6



helm upgrade --install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true \
  --version v1.7.1 \
  --set 'extraArgs={--acme-http01-solver-nameservers=10.1.0.13:53\,10.96.0.10:53\,192.168.1.1:53}'