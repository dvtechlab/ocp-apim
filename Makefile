helm install wso2am-dev charts/wso2-am --version 4.2.0-1 --namespace dev
helm upgrade --install wso2am-dev charts/wso2-am --version 4.2.0-1 --namespace dev


oc get replicaset -n dev


oc describe replicaset [replicaset-name] -n dev
