#references 
# https://github.com/jfrog/charts/tree/master/stable/artifactory
# There is a values yaml for small, big and midium size requirement

kubectl create namespace artifactory

helm repo add jfrog https://charts.jfrog.io
helm repo update


#Production

export MASTER_KEY=$(openssl rand -hex 32)
echo ${MASTER_KEY}

export JOIN_KEY=$(openssl rand -hex 32)
echo ${JOIN_KEY}

helm upgrade --install artifactory \
 --set artifactory.masterKey=${MASTER_KEY} \
 --set artifactory.joinKey=${JOIN_KEY} \
 --namespace artifactory jfrog/artifactory


 #Developmental

helm upgrade --install artifactory --namespace artifactory jfrog/artifactory


#Uninstalling Artifactory

helm uninstall artifactory && sleep 90 && kubectl delete pvc -l app=artifactory

gsutil rm -r gs://artifactory gcloud sql instances delete artifactory