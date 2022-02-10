#https://github.com/sonatype/helm3-charts/tree/main/charts/nexus-repository-manager

helm repo add sonatype https://sonatype.github.io/helm3-charts/
helm repo update
helm install -n nexus-rm nexus-rm sonatype/nexus-repository-manager [ --version v29.2.0 ]

