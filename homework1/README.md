# Домашнее задание №1

- Запустить minikube `minikube start`
- Добавть nginx ingress controller `minikube addons enable ingress`
- Выполнить `kubectl apply -f k8s/.`
- Добавить в /etc/hosts `{ingress_endpoint_ip} arch.homework`
- Запустить тесты в Postman `homework1.postman_collection.json`