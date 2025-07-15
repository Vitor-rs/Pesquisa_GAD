# Dockerfile para desenvolvimento
FROM openjdk:21-jdk-slim

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Configurar diretório de trabalho
WORKDIR /app

# Copiar arquivos do Maven wrapper e dar permissões
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:go-offline -B

# Copiar código fonte
COPY src/ src/

# Expor porta da aplicação
EXPOSE 8080

# Comando para desenvolvimento (hot reload)
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.jvmArguments='-Dspring.profiles.active=dev'"]
