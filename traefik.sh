helm repo add traefik https://helm.traefik.io/traefik

helm upgrade --install traefik traefik/traefik \
    --create-namespace --namespace traefik --set "ports.websecure.tls.enabled=true" \
    --set "providers.kubernetesIngress.publishedService.enabled=true"


k -n sonarqube create ingress sonarqube-sonarqube --rule=gitlab.bci.ikp.com/*=sonarqube-sonarqube:80

k -n traefik create ingress traefik --rule=gitlab.bci.ikp.com/*=traefik:80


helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --set controller.publishService.enabled=true \
  --namespace ingress-nginx --create-namespace \
  --set watchIngressWithoutClass=true \
  --set ingressClassResource.default=true \
  --set ingressClassByName=true

  kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80


k -n sonarqube create ingress sonarqube-sonarqube --rule=gitlab.bci.ikp.com/*=sonarqube-sonarqube:80, tls=gitlab.bci.ikp.com