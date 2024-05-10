# Banco de Dados do Sistema de Gerenciamento de Manuais da Dell

Este documento fornece uma descrição detalhada das tabelas e relações no banco de dados utilizado pelo sistema de gerenciamento de manuais da Dell. O esquema foi projetado para suportar o cadastro e a gestão de manuais utilizados para o treinamento dos funcionários, incluindo montadores e administradores.

## Tabelas

### 1. `users`
Tabela para armazenar informações dos usuários, que podem ser tanto administradores quanto montadores.

- **id** (INTEGER): Chave primária, identificador único do usuário.
- **nome** (VARCHAR(50)): Nome do usuário.
- **cpf** (INTEGER): CPF do usuário (Número de Cadastro de Pessoas Físicas).
- **email** (VARCHAR(50)): Endereço de email do usuário.
- **senha** (VARCHAR(50)): Senha do usuário para acesso ao sistema.
- **created_at** (TIMESTAMP): Data e hora da criação do registro.
- **last_login** (TIMESTAMP): Data e hora do último acesso do usuário.

### 2. `membro`
Tabela para detalhar informações específicas dos montadores da fábrica.

- **id** (INTEGER): Chave primária, identificador único do membro.
- **id_users** (INTEGER): Chave estrangeira que referencia o `id` na tabela `users`.
- **linha_de_producao** (VARCHAR(30)): Linha de produção onde o membro trabalha.
- **funcao** (VARCHAR(30)): Função específica do membro na linha de produção.

### 3. `admin`
Tabela para detalhar informações específicas dos administradores.

- **id** (INTEGER): Chave primária, identificador único do administrador.
- **id_users** (INTEGER): Chave estrangeira que referencia o `id` na tabela `users`.
- **linha_de_producao** (VARCHAR(30)): Linha de produção associada ao administrador.
- **funcao** (VARCHAR(30)): Função específica do administrador.

### 4. `manuais`
Tabela para armazenar dados dos manuais.

- **id** (INTEGER): Chave primária, identificador único do manual.
- **titulo** (VARCHAR(50)): Título do manual.
- **descricao** (VARCHAR(300)): Descrição breve do conteúdo do manual.
- **id_admin** (INTEGER): Chave estrangeira que referencia o `id` na tabela `admin`.
- **created_at** (TIMESTAMP): Data e hora da criação do manual.
- **updated_at** (TIMESTAMP): Data e hora da última atualização do manual.

### 5. `arquivos`
Tabela para gerenciar os arquivos contidos nos manuais.

- **id** (INTEGER): Chave primária, identificador único do arquivo.
- **id_manuais** (INTEGER): Chave estrangeira que referencia o `id` na tabela `manuais`.
- **nome** (VARCHAR(50)): Nome do arquivo.
- **path** (VARCHAR(50)): Caminho do arquivo no sistema de armazenamento.
- **tipo** (VARCHAR(30)): Tipo do arquivo (pdf, jpg, mp4, etc.).

### 6. `manuais_membro`
Tabela intermediária entre manuais e membros para estabelecer quais manuais cada membro pode acessar.

- **id** (INTEGER): Chave primária, identificador único da relação.
- **id_manuais** (INTEGER): Chave estrangeira que referencia o `id` na tabela `manuais`.
- **id_membro** (INTEGER): Chave estrangeira que referencia o `id` na tabela `membro`.

## Relações

Cada tabela foi projetada para interagir de forma eficiente dentro do sistema, garantindo integridade dos dados e facilitando o acesso e gestão de informações relacionadas a manuais e seus usuários.

Este esquema é vital para o correto funcionamento do sistema de treinamento da Dell, proporcionando uma organização eficaz e segura das informações necessárias para o desenvolvimento dos funcionários.
