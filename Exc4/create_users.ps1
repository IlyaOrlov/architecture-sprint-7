kubectl create serviceaccount developer -n default
kubectl create serviceaccount engineer -n default
kubectl create serviceaccount devops -n default

kubectl create token developer -n default
kubectl create token engineer -n default
kubectl create token devops -n default
