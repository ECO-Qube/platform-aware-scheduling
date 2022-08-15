kubectl create namespace monitoring
kubens monitoring
helm install node-exporter deploy/charts/prometheus_node_exporter_helm_chart/
helm install prometheus deploy/charts/prometheus_helm_chart/

kubectl create namespace custom-metrics
kubens custom-metrics
kubectl -n custom-metrics create secret tls cm-adapter-serving-certs --cert=/Users/boyan/Documents/playground/platform-aware-scheduling/serving-ca.crt --key=/Users/boyan/Documents/playground/platform-aware-scheduling/serving-ca.key
helm install prometheus-adapter deploy/charts/prometheus_custom_metrics_helm_chart/

kubens default
kubectl -n default create secret tls extender-secret --cert=/Users/boyan/Documents/playground/platform-aware-scheduling/extender-ca.crt --key=/Users/boyan/Documents/playground/platform-aware-scheduling/extender-ca.key
kubectl apply -f deploy/