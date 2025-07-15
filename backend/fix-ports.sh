#!/bin/bash
# Script para resolver problemas de port forwarding no Codespaces

echo "🔧 Resolvendo problemas de port forwarding..."

# 1. Verificar se as portas estão abertas
echo "📊 Verificando portas abertas:"
netstat -tlnp | grep -E ":(5050|8080|5432)"

# 2. Verificar containers
echo -e "\n🐳 Status dos containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

# 3. Testar conectividade local
echo -e "\n🌐 Testando conectividade:"
echo "PGAdmin (5050):"
curl -s -o /dev/null -w "Status: %{http_code}\n" http://localhost:5050

echo "Spring Boot (8080):"
curl -s -o /dev/null -w "Status: %{http_code}\n" http://localhost:8080

echo -e "\n✅ Script executado. Vá na aba 'Ports' do VS Code para acessar as URLs."
