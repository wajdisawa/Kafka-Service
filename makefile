#!makefile

.PHONY: run
run: ## run image
# you may need to uncomment this for the first run to make sure of the files permissions
# 	chmod -R o+rw data
# 	chmod -R o+rw conf
	docker-compose up -d --remove-orphans

.PHONY: stop
stop: ## stop image
	docker-compose down --remove-orphans

.PHONY: enter_Kafka
enter: ## enter image
	docker-compose exec kafka bash

.PHONY: helm_deploy
helm_deploy: ## use helm to deploy the services
#  	kubectl create namespace web-service-qa
	helm repo add bitnami https://charts.bitnami.com/bitnami
	helm repo add lensesio https://lensesio.github.io/kafka-helm-charts/
	helm repo update
	helm upgrade --install -f helm/kafka/values.yaml kafka-service bitnami/kafka --namespace kafka-services
	helm upgrade --install -f helm/lenses/values.yaml kafka-lenses lensesio/lenses --set name=lenses --namespace kafka-services

.PHONY: help
help: ## Help
	@grep -E '^[0-9a-zA-Z_/()$$-]+:.*?## .*$$' $(lastword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'