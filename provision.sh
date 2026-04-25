#!/bin/bash

# Cores para a TUI
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}==========================================================${NC}"
echo -e "${BLUE}          IF-CODES: INSTALADOR AUTOMATIZADO               ${NC}"
echo -e "${BLUE}==========================================================${NC}"

# 1. Coleta de dados
echo -e "\n${YELLOW}--- Configurações de Banco de Dados ---${NC}"
read -p "Digite a senha para o Banco de Dados (Postgres): " DB_PASSWORD
if [ -z "$DB_PASSWORD" ]; then
    DB_PASSWORD="changeme-please-set-strong-password"
    echo -e "${YELLOW}Usando senha padrão: $DB_PASSWORD${NC}"
fi

echo -e "\n${YELLOW}--- Configurações Opcionais ---${NC}"
read -p "Nome da Aplicação [IF-Codes]: " APP_NAME
APP_NAME=${APP_NAME:-"IF-Codes"}

read -p "Porta do Backend [8001]: " APP_PORT
APP_PORT=${APP_PORT:-"8001"}

# 2. Criação dos arquivos .env
echo -e "\n${BLUE}[1/4] Configurando arquivos .env...${NC}"

# Backend
cp back/src/.env.example back/src/.env
sed -i "s|APP_URL=.*|APP_URL=http://localhost:$APP_PORT|" back/src/.env
sed -i "s|DB_PASSWORD=.*|DB_PASSWORD=$DB_PASSWORD|" back/src/.env
sed -i "s|APP_NAME=.*|APP_NAME=\"$APP_NAME\"|" back/src/.env

# Judge0
cp judge0.conf.example judge0.conf
sed -i "s|POSTGRES_PASSWORD=.*|POSTGRES_PASSWORD=$DB_PASSWORD|" judge0.conf

# Frontend
cp front/.env.example front/.env
sed -i "s|VITE_API_URL=.*|VITE_API_URL=http://localhost:$APP_PORT|" front/.env
sed -i "s|VITE_APP_NAME=.*|VITE_APP_NAME=\"$APP_NAME\"|" front/.env

# 3. Docker
echo -e "${BLUE}[2/4] Subindo containers (isso pode demorar na primeira vez)...${NC}"
export BACKEND_PORT=$APP_PORT
docker-compose down -v > /dev/null 2>&1
docker-compose up -d --build

# 4. Inicialização do Laravel
echo -e "${BLUE}[3/4] Aguardando inicialização do banco de dados (10s)...${NC}"
sleep 10

echo -e "${BLUE}[4/4] Executando Migrations e Seeds...${NC}"
docker exec laravel_app php artisan key:generate --force
docker exec laravel_app php artisan migrate:fresh --seed --force

echo -e "\n${GREEN}==========================================================${NC}"
echo -e "${GREEN}       INSTALAÇÃO CONCLUÍDA COM SUCESSO!                  ${NC}"
echo -e "${GREEN}==========================================================${NC}"
echo -e "Frontend: http://localhost:5173"
echo -e "Backend:  http://localhost:$APP_PORT"
echo -e "Credenciais: admin@admin.com / password"
echo -e "${GREEN}==========================================================${NC}"
