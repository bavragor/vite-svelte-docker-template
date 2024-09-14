# Variables
DOCKER_COMPOSE_FILE = docker-compose.yaml
SERVICE_NAME = app

# Default target
.DEFAULT_GOAL := help

# Help target: provides a list of all available make commands
help:
	@echo "Usage: make [target]"
	@echo
	@echo "Available targets:"
	@echo "  up           Start the containers (docker compose up)"
	@echo "  down         Stop and remove the containers (docker compose down)"
	@echo "  install      Install dependencies using pnpm inside the container"
	@echo "  restart      Restart the containers (docker compose restart)"
	@echo "  logs         View logs of the app service"
	@echo "  exec         Enter the app container with a shell (bash or sh)"
	@echo "  clean        Stop containers and remove volumes"
	@echo "  prune        Prune unused Docker volumes and images"
	@echo "  build        Build or rebuild the Docker containers"
	@echo "  ps           List running Docker containers"

# Start containers
up:
	@echo "Starting containers..."
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

# Stop and remove containers
down:
	@echo "Stopping containers..."
	docker compose -f $(DOCKER_COMPOSE_FILE) down

# Install dependencies
install:
	@echo "Installing dependencies inside the container..."
	docker compose -f $(DOCKER_COMPOSE_FILE) exec $(SERVICE_NAME) pnpm install

# Restart containers
restart:
	@echo "Restarting containers..."
	docker compose -f $(DOCKER_COMPOSE_FILE) restart

# View logs
logs:
	@echo "Viewing logs for the service..."
	docker compose -f $(DOCKER_COMPOSE_FILE) logs -f $(SERVICE_NAME)

# Execute a command in the app container (default to sh)
exec:
	@echo "Entering the container shell..."
	docker compose -f $(DOCKER_COMPOSE_FILE) exec $(SERVICE_NAME) sh

# Stop containers and remove volumes
clean:
	@echo "Stopping containers and removing volumes..."
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v

# Prune unused Docker volumes and images
prune:
	@echo "Pruning unused Docker resources..."
	docker system prune -f --volumes

# Build or rebuild the Docker containers
build:
	@echo "Building/rebuilding containers..."
	docker compose -f $(DOCKER_COMPOSE_FILE) build

# List running containers
ps:
	@echo "Listing running containers..."
	docker compose -f $(DOCKER_COMPOSE_FILE) ps
