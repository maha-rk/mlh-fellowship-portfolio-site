#!/bin/bash
set -e

PROJECT_DIR="$HOME/mlh-fellowship-portfolio-site"

cd "$PROJECT_DIR"

git fetch && git reset origin/main --hard

docker compose -f docker-compose.prod.yml down

docker compose -f docker-compose.prod.yml up -d --build

echo "Redeploy complete. myportfolio containers restarted."
