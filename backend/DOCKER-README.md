# 🐳 GAD Backend - Guia de Desenvolvimento com Docker

> 🌐 **VS Code Online?** Veja o guia específico: [`VSCODE-ONLINE.md`](./VSCODE-ONLINE.md)

## 🚀 Configuração Inicial

1. **Copie o arquivo de exemplo para suas credenciais:**
```bash
cp .env.example .env
```

2. **Edite o arquivo `.env` com suas credenciais seguras:**
```bash
# Exemplo de configuração
POSTGRES_DB=gad_db
POSTGRES_USER=gad_user
POSTGRES_PASSWORD=sua_senha_segura_aqui
PGADMIN_DEFAULT_EMAIL=seu_email@example.com
PGADMIN_DEFAULT_PASSWORD=sua_senha_pgadmin
```

## 🐳 Comandos Docker

### Desenvolvimento Completo
```bash
# Iniciar todos os serviços (PostgreSQL + App + PGAdmin)
docker-compose up -d

# Ver logs da aplicação
docker-compose logs -f app

# Parar todos os serviços
docker-compose down
```

### Apenas Banco de Dados (para desenvolvimento local)
```bash
# Iniciar apenas PostgreSQL
docker-compose up -d postgres

# Conectar ao banco
docker-compose exec postgres psql -U gad_user -d gad_db
```

### Rebuild da Aplicação
```bash
# Rebuild e restart da aplicação
docker-compose up -d --build app
```

## 🔗 Endpoints de Acesso

### VS Code Online (Codespaces/GitPod)
- **Aplicação:** Será exibida automaticamente na aba "Ports" do VS Code
  - Porta 8080 → URL gerada automaticamente
- **PGAdmin:** Porta 5050 → URL gerada automaticamente  
- **PostgreSQL:** Conecte via port forwarding na porta 5432

### Desenvolvimento Local
- **Aplicação:** http://localhost:8080
- **PGAdmin:** http://localhost:5050
- **PostgreSQL:** localhost:5432

> 💡 **Dica VS Code Online:** Após iniciar os containers, vá na aba "Ports" (próximo ao terminal) para ver as URLs geradas automaticamente.

## 📊 PGAdmin Setup

### Para VS Code Online (Codespaces):
1. Inicie os containers: `docker-compose up -d`
2. Vá na aba **"Ports"** do VS Code (próximo ao terminal)
3. Encontre a porta 5050 e clique na URL gerada
4. Login com credenciais do `.env`
5. Adicione servidor PostgreSQL:
   - Host: `postgres` (nome do container)
   - Port: `5432`
   - Database: `gad_db`
   - Username/Password: conforme `.env`

### Para desenvolvimento local:
1. Acesse http://localhost:5050
2. Login com credenciais do `.env`
3. Adicione servidor:
   - Host: `postgres`
   - Port: `5432`
   - Database: `gad_db`
   - Username/Password: conforme `.env`

## 🌐 Configuração Específica para VS Code Online

### Port Forwarding Automático
O VS Code online (Codespaces/GitPod) detecta automaticamente as portas expostas pelos containers:

- **Porta 8080** (Spring Boot) → URL única gerada
- **Porta 5050** (PGAdmin) → URL única gerada  
- **Porta 5432** (PostgreSQL) → Disponível para conexões externas

### Como Acessar os Serviços

1. **Inicie os containers:**
```bash
docker-compose up -d
```

2. **Acesse a aba "Ports"** no VS Code (geralmente próxima ao terminal)

3. **Clique nas URLs geradas** para acessar:
   - Spring Boot App (porta 8080)
   - PGAdmin (porta 5050)

### Testando a Conectividade
```bash
# Verificar se os containers estão rodando
docker-compose ps

# Verificar logs da aplicação
docker-compose logs -f app

# Testar conexão com PostgreSQL
docker-compose exec postgres psql -U gad_user -d gad_db -c "SELECT version();"
```

## 🛠️ Desenvolvimento

### Hot Reload
O volume mapeado permite hot reload:
- Altere código → Spring DevTools reinicia automaticamente
- Dependências Maven são cached para builds mais rápidos

### Logs e Debug
```bash
# Logs da aplicação
docker-compose logs -f app

# Entrar no container da aplicação
docker-compose exec app bash

# Reiniciar apenas a aplicação
docker-compose restart app
```

## 📁 Estrutura dos Arquivos Docker

```
backend/
├── Dockerfile              # Container da aplicação
├── compose.yaml            # Orquestração dos serviços
├── .dockerignore          # Arquivos ignorados no build
├── .env.example           # Template de variáveis
└── docker/
    └── init.sql           # Script de inicialização do DB
```
