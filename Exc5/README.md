# Управление трафиком внутри кластера Kubertnetes.

1. Запустить minikube

    ```
    minikube start
    ```

2. Поднять сервисы

    ```
    kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80
    kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80
    kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80
    kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80
    ```

3. Применить политики

    ```
    kubectl apply -f non-admin-api-allow.yaml
    ```


4. Проверить запрещенный трафик

    ```
    kubectl run test-1 --rm -i -t --image=alpine -- wget -qO- --timeout=2 http://back-end-api-app
    ```

5. Проверить разрешенный трафик

    ```
    kubectl exec -it front-end-app -- curl http://back-end-api-app
    ```

6. Остановить Minikube для завершения работы

    ```
    minikube stop
    ```
