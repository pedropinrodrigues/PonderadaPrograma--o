-- Criação da tabela 'users'
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- Criação da tabela 'membro'
CREATE TABLE membro (
    id SERIAL PRIMARY KEY,
    id_users INTEGER NOT NULL REFERENCES users(id),
    linha_de_producao VARCHAR(30),
    funcao VARCHAR(30)
);

-- Criação da tabela 'admin'
CREATE TABLE admin (
    id SERIAL PRIMARY KEY,
    id_users INTEGER NOT NULL REFERENCES users(id),
    linha_de_producao VARCHAR(30),
    funcao VARCHAR(30)
);

-- Criação da tabela 'manuais'
CREATE TABLE manuais (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    descricao VARCHAR(300),
    id_admin INTEGER REFERENCES admin(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

-- Criação da tabela 'arquivos'
CREATE TABLE arquivos (
    id SERIAL PRIMARY KEY,
    id_manuais INTEGER NOT NULL REFERENCES manuais(id),
    nome VARCHAR(50) NOT NULL,
    path VARCHAR(50) NOT NULL,
    tipo VARCHAR(30)
);

-- Criação da tabela 'manuais_membro'
CREATE TABLE manuais_membro (
    id SERIAL PRIMARY KEY,
    id_manuais INTEGER REFERENCES manuais(id),
    id_membro INTEGER REFERENCES membro(id)
);
