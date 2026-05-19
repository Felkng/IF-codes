# Project Makefile

.PHONY: up down build restart logs clean shell-back shell-front shell-ws migrate seed fresh composer-install npm-install provision help

# --- SETUP ---

provision: ## Run the automated installation script (sets .env, keys, and DB)
	chmod +x provision.sh
	./provision.sh

# --- DOCKER MANAGEMENT ---

up: ## Start containers in detached mode (recreating them)
	docker compose up -d --force-recreate

down: ## Stop containers
	docker compose down

build: ## Build containers
	docker compose build

restart: ## Restart containers
	docker compose restart

logs: ## View logs for all containers
	docker compose logs -f

clean: ## Remove containers, networks, volumes, and images
	docker compose down -v --rmi all

# --- SHELL ACCESS ---

shell-back: ## Open bash in the backend container
	docker exec -it laravel_app bash

shell-front: ## Open sh in the frontend container
	docker exec -it react_app sh

shell-ws: ## Open sh in the ws_server container
	docker exec -it ws_server sh

# --- LARAVEL (BACKEND) ---

migrate: ## Run database migrations
	docker exec -it laravel_app php artisan migrate

seed: ## Run database seeders
	docker exec -it laravel_app php artisan db:seed

fresh: ## Fresh migration and seed
	docker exec -it laravel_app php artisan migrate:fresh --seed

composer-install: ## Install composer dependencies
	docker exec -it laravel_app composer install

# --- NPM (FRONTEND & WS SERVER) ---

npm-install: ## Install NPM packages for frontend and ws server
	docker exec -it react_app npm install
	docker exec -it ws_server npm install

# --- HELP ---

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
