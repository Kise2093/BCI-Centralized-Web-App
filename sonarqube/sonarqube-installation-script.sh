#https://github.com/SonarSource/helm-chart-sonarqube/tree/master/charts/sonarqube

helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
kubectl create namespace sonarqube
helm upgrade --install -n sonarqube sonarqube sonarqube/sonarqube