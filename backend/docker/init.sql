-- Script de inicialização do banco de dados
-- Este script é executado automaticamente quando o container do PostgreSQL é criado

-- Criar schema para o sistema GAD
CREATE SCHEMA IF NOT EXISTS gad;

-- Exemplo de tabela para certificados
CREATE TABLE IF NOT EXISTS gad.certificates (
    id BIGSERIAL PRIMARY KEY,
    filename VARCHAR(255) NOT NULL,
    original_text TEXT,
    extracted_text TEXT,
    classification VARCHAR(100),
    confidence_score DECIMAL(5,4),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Exemplo de tabela para configurações de ML
CREATE TABLE IF NOT EXISTS gad.ml_models (
    id BIGSERIAL PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    model_version VARCHAR(50),
    model_path VARCHAR(255),
    accuracy DECIMAL(5,4),
    is_active BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserir dados de exemplo (opcional)
INSERT INTO gad.ml_models (model_name, model_version, accuracy, is_active) VALUES
('Certificate Classifier v1', '1.0.0', 0.8500, true)
ON CONFLICT DO NOTHING;
