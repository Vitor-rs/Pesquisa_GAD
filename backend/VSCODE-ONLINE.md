# 🌐 Configuração para VS Code Online (Codespaces/GitPod)

## ⚡ Quick Start

```bash
# 1. Configure credenciais
cp .env.example .env

# 2. Inicie os containers
docker-compose up -d

# 3. Vá na aba "Ports" do VS Code para acessar as URLs
```

## 🔗 Acessando os Serviços

### Através da aba "Ports" do VS Code:

1. **Inicie os containers** com `docker-compose up -d`
2. **Aba "Ports"** ficará disponível próxima ao terminal
3. **URLs automáticas** serão geradas para:
   - **8080** → Spring Boot Application  
   - **5050** → PGAdmin Interface
   - **5432** → PostgreSQL (para ferramentas externas)

### URLs típicas (exemplo):
- `https://8080-username-repository-xyz.preview.app.github.dev` (Spring Boot)
- `https://5050-username-repository-xyz.preview.app.github.dev` (PGAdmin)

## 🛠️ Comandos Úteis

```bash
# Ver status dos containers
docker-compose ps

# Ver logs em tempo real
docker-compose logs -f app

# Testar conexão com banco
docker-compose exec postgres psql -U gad_user -d gad_db -c "\l"

# Parar tudo
docker-compose down
```

## 🗄️ Conectando ao PostgreSQL

### Via PGAdmin (Web Interface):
1. Acesse a URL da porta 5050 (aba "Ports")
2. Login: `admin@gad.com` / `changeme` (ou conforme `.env`)
3. Adicionar servidor:
   - **Host:** `postgres`
   - **Port:** `5432`
   - **Database:** `gad_db`
   - **Username:** `gad_user`
   - **Password:** `changeme` (ou conforme `.env`)

### Via linha de comando:
```bash
# Entrar no container e conectar
docker-compose exec postgres psql -U gad_user -d gad_db

# Verificar tabelas criadas
\dt gad.*

# Sair
\q
```

## 🚀 Para seu TCC

### 1. Upload de PDFs
A aplicação estará acessível pela URL da porta 8080. Você pode:
- Fazer upload de certificados PDF
- Testar APIs de processamento de texto
- Visualizar resultados no banco

### 2. Desenvolvimento
- **Hot Reload:** Qualquer mudança no código reinicia automaticamente
- **Logs:** `docker-compose logs -f app` para debug
- **Banco:** Use PGAdmin para visualizar dados processados

### 3. Machine Learning
- Spring AI já configurado
- Banco preparado para armazenar:
  - Texto extraído dos PDFs
  - Classificações do ML
  - Scores de confiança

## 🔧 Troubleshooting

### Portas não aparecem na aba "Ports":
```bash
# Verificar se containers estão rodando
docker ps

# Reiniciar se necessário  
docker-compose restart
```

### PGAdmin não conecta ao PostgreSQL:
- Verifique se ambos containers estão UP: `docker-compose ps`
- Use `postgres` como hostname (não IP)
- Verifique credenciais no arquivo `.env`

### Spring Boot não inicia:
```bash
# Ver logs detalhados
docker-compose logs app

# Rebuild se necessário
docker-compose up -d --build app
```
