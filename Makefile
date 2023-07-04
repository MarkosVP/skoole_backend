# Declare the Gateway APi project container name
GATEWAY_CONTAINER := skoole_gateway

# Defino a regra padrão executada pelo comando 'make'
.DEFAULT_GOAL := help

help: ## Show all Make avaliable commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

fix-permissions: ## Update all file permissions
	sudo chmod -R a+rwx .

prepare-environment: ## Install the dependencies on all projects
	docker compose run $(GATEWAY_CONTAINER) npm install

delete-packages: ## Delete all package folders on all projects
	rm -rf gateway_api/app/node_modules;

up: ## Up Skoole Environment
	docker compose up

up-in-background: ## Up Skoole Environment in terminal background
	docker compose up -d

down: ## Down the hole Skoole Environment
	docker compose down --remove-orphans

build:  ## Build again all containers
	docker compose up --build

access-app: ## Access the Gateway API CLI
	docker exec -it $(GATEWAY_CONTAINER) bash