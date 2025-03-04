# Защита доступа к кластеру Kubernetes.

1. Запустить minikube

    ```
    minikube start
    ```

2. Создать пользователей

    ```
    kubectl create serviceaccount developer -n default
    kubectl create serviceaccount engineer -n default
    kubectl create serviceaccount devops -n default

    kubectl create token developer -n default
    kubectl create token engineer -n default
    kubectl create token devops -n default
    ```
    (либо запустить скрипт `create_users.ps1` в Windows Power Shell).

3. Создать роли

    ```
    kubectl apply -f roles.yaml
    ```

4. Привязать пользователей к ролям
    ```
    kubectl apply -f role-bindings.yaml
    ```

5. Проверить итоговые настройки RBAC в кластере.
    ```
    kubectl get roles,rolebindings --all-namespaces
    ```

6. Остановить Minikube для завершения работы

    ```
    minikube stop
    ```
