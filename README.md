# IF-Codes - Sistema de Submissão de Atividades

Este projeto é uma plataforma para gerenciamento e submissão de atividades de programação, integrando Laravel (Backend), React (Frontend), Judge0 (Executor de código) e WebSockets.

## 🛠 Pré-requisitos

- Docker e Docker Compose instalados.
- Git.

## 🚀 Como Executar o Projeto

Siga os passos abaixo para subir o ambiente completo:

### 1. Clonar e Configurar Variáveis de Ambiente

```bash
# Copiar arquivos de configuração do Backend
cp back/src/.env.example back/src/.env

# Copiar arquivos de configuração do Frontend
cp front/.env.example front/.env

# Copiar configuração do Judge0
cp judge0.conf.example judge0.conf
```

**Nota:** As portas padrão configuradas são:
- Frontend: `http://localhost:5173`
- Backend API: `http://localhost:8001` (Porta alterada para evitar conflitos)
- WebSocket: `ws://localhost:3002`

### 2. Subir os Containers

```bash
docker-compose up -d --build
```

### 3. Preparar o Banco de Dados

```bash
# Gerar chave da aplicação
docker exec laravel_app php artisan key:generate

# Executar migrations e alimentar o banco (Seeders)
docker exec laravel_app php artisan migrate:fresh --seed
```

## 🔐 Credenciais Padrão (Seed)

- **Admin:** `admin@admin.com` / `password`
- **Professor:** `professor@ifcodes.com` / `password`
- **Aluno:** `aluno@ifcodes.com` / `password`

## 🐳 Estrutura de Serviços

- **laravel_app**: Backend na porta `8001`.
- **react_app**: Frontend na porta `5173`.
- **postgres**: Banco de dados PostgreSQL (porta `5432`).
- **judge0_server**: API de execução de código (porta `2358`).
- **ws_server**: Servidor de notificações WebSocket (porta `3002`).
- **mailpit**: Interface de testes de e-mail (porta `8025`).

## ⚠️ Solução de Problemas

Se receber erros de `Connection Reset` ou `Invalid URL`:
1. Verifique se a porta `8001` está acessível em seu navegador.
2. Certifique-se de que o arquivo `front/.env` possui a variável `VITE_API_URL=http://localhost:8001`.
3. Limpe o cache do navegador ou use uma aba anônima.
