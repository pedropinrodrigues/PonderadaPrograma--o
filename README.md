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

    - **Relações:**
  - Usuários podem ser membros (`membro`) ou administradores (`admin`).

### 2. `membro`
Tabela para detalhar informações específicas dos montadores da fábrica.

- **id** (INTEGER): Chave primária, identificador único do membro.
- **id_users** (INTEGER): Chave estrangeira que referencia o `id` na tabela `users`.
- **linha_de_producao** (VARCHAR(30)): Linha de produção onde o membro trabalha.
- **funcao** (VARCHAR(30)): Função específica do membro na linha de produção.

    - **Cardinalidade:** 1:N (um usuário pode ser muitos membros)

### 3. `admin`
Tabela para detalhar informações específicas dos administradores.

- **id** (INTEGER): Chave primária, identificador único do administrador.
- **id_users** (INTEGER): Chave estrangeira que referencia o `id` na tabela `users`.
- **linha_de_producao** (VARCHAR(30)): Linha de produção associada ao administrador.
- **funcao** (VARCHAR(30)): Função específica do administrador.

    - **Cardinalidade:** 1:N (um usuário pode ser muitos administradores)

### 4. `manuais`
Tabela para armazenar dados dos manuais.

- **id** (INTEGER): Chave primária, identificador único do manual.
- **titulo** (VARCHAR(50)): Título do manual.
- **descricao** (VARCHAR(300)): Descrição breve do conteúdo do manual.
- **id_admin** (INTEGER): Chave estrangeira que referencia o `id` na tabela `admin`.

    - **Cardinalidade:** 1:N (um administrador pode criar muitos manuais)

### 5. `arquivos`
Tabela para gerenciar os arquivos contidos nos manuais.

- **id** (INTEGER): Chave primária, identificador único do arquivo.
- **id_manuais** (INTEGER): Chave estrangeira que referencia o `id` na tabela `manuais`.
- **nome** (VARCHAR(50)): Nome do arquivo.
- **path** (VARCHAR(50)): Caminho do arquivo no sistema de armazenamento.
- **tipo** (VARCHAR(30)): Tipo do arquivo (pdf, jpg, mp4, etc.).

    - **Cardinalidade:** 1:N (um manual pode conter vários arquivos)

### 6. `manuais_membro`
Tabela intermediária entre manuais e membros para estabelecer quais manuais cada membro pode acessar.

- **id** (INTEGER): Chave primária, identificador único da relação.
- **id_manuais** (INTEGER): Chave estrangeira que referencia o `id` na tabela `manuais`.
- **id_membro** (INTEGER): Chave estrangeira que referencia o `id` na tabela `membro`.

    - **Cardinalidade:** N:N (muitos manuais podem ser acessados por muitos membros)


Sempre que houver uma relação de N:N entre tabelas se faz necessário uma tabela intermediária para gerenciar esses dados.
