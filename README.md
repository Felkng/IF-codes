# IF-Codes - Sistema de Submissão de Atividades

Este projeto é uma plataforma para gerenciamento e submissão de atividades de programação, integrando Laravel (Backend), React (Frontend), Judge0 (Executor de código) e WebSockets.

## 🛠 Pré-requisitos

- Docker e Docker Compose instalados.
- Git.

## 🚀 Como Executar o Projeto (Recomendado)

O projeto possui um script de instalação automatizada que configura os arquivos `.env`, as chaves da aplicação e o banco de dados.

```bash
# 1. Torne o script executável
chmod +x provision.sh

# 2. Execute o instalador
./provision.sh
```

O script solicitará:
- Senha para o banco de dados.
- Nome da aplicação.
- Porta para o Backend (Padrão: 8000).

---

## 🔐 Credenciais Padrão (Seed)

- **Admin:** `admin@admin.com` / `12345678`
- **Professor:** `professor@ifcodes.com` / `12345678`
- **Aluno:** `aluno@ifcodes.com` / `12345678`

## 🐳 Estrutura de Serviços

- **laravel_app**: Backend (porta definida no instalador).
- **react_app**: Frontend na porta `5173`.
- **postgres**: Banco de dados PostgreSQL (porta `5432`).
- **judge0_server**: API de execução de código (porta `2358`).
- **ws_server**: Servidor de notificações WebSocket (porta `3002`).
- **mailpit**: Interface de testes de e-mail (porta `8025`).

## ⚠️ Solução de Problemas

Se receber erros de `Connection Reset` ou `Invalid URL`:
1. Verifique se a porta escolhida está correta no arquivo `front/.env`.
2. Certifique-se de que os containers estão rodando: `docker ps`.
3. Limpe o cache do navegador ou use uma aba anônima.
