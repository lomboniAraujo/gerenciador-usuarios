# Gerenciador de Usuários Java Web

Aplicação web simples em Java 17 com Jakarta Servlet 5, JSP, JDBC e H2 Database, desenvolvida em arquitetura MVC simples com separação por camadas e Maven.

## Objetivo

Este projeto demonstra de forma prática os principais conceitos do módulo de Programação Servidor com Java, incluindo:

- mapeamento de requisições HTTP com `@WebServlet`
- uso de `HttpServletRequest` e `HttpServletResponse`
- controle de sessão com `HttpSession`
- acesso a banco de dados com JDBC
- padrão DAO (`Data Access Object`)
- renderização de páginas com JSP
- estrutura de projeto Maven WAR

## Tecnologias

- Java 17
- Jakarta Servlet 5.0+
- JSP / JSTL
- JDBC
- H2 Database em memória
- Apache Tomcat 10+
- Maven

## Estrutura do projeto

```text
gerenciador-usuarios/
├── pom.xml
├── README.md
└── src/
    ├── main/
    │   ├── java/
    │   │   └── com/
    │   │       └── exemplo/
    │   │           ├── controller/
    │   │           │   └── UsuarioServlet.java
    │   │           ├── dao/
    │   │           │   ├── Conexao.java
    │   │           │   └── UsuarioDAO.java
    │   │           ├── model/
    │   │           │   └── Usuario.java
    │   │           └── view/
    │   └── webapp/
    │       ├── index.jsp
    │       └── listar.jsp
```

## Como executar

### 1. Clonar o projeto

```bash
git clone <url-do-repositorio>
cd gerenciador-usuarios
```

### 2. Compilar o projeto

```bash
mvn clean package
```

### 3. Implantar no Tomcat

Copie o arquivo gerado em `target/gerenciador-usuarios.war` para a pasta `webapps` do Apache Tomcat 10+

Exemplo:

```bash
cp target/gerenciador-usuarios.war /caminho/para/tomcat/webapps/
```

### 4. Acessar a aplicação

Após iniciar o Tomcat, abra no navegador:

```text
http://localhost:8080/gerenciador-usuarios/
```

## Funcionalidades

- cadastro de usuários via formulário em `index.jsp`
- envio por `POST` para `UsuarioServlet`
- validação de campos
- armazenamento em banco H2 em memória
- listagem de usuários em `listar.jsp`
- mensagens temporárias de feedback via `HttpSession`

## Banco de dados

A aplicação usa H2 em modo memória com a seguinte URL:

```text
jdbc:h2:mem:gerenciador_usuarios;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
```

A tabela é criada automaticamente pela classe `Conexao` se ainda não existir.

## Arquivos principais

- `pom.xml`: configuração do Maven e dependências
- `Conexao.java`: conexão com o banco H2
- `UsuarioDAO.java`: operações de persistência
- `UsuarioServlet.java`: gerenciamento de requisições HTTP e sessão
- `index.jsp`: página de cadastro
- `listar.jsp`: listagem dos usuários cadastrados

## Observações

Este projeto é uma base didática e de estudo para a disciplina de Programação Servidor com Java. Ele pode ser expandido para incluir autenticação, validação mais robusta, páginas de edição e exclusão, além de padrões mais avançados como MVC completo, filtros e serviços.

## Licença

Este projeto foi desenvolvido para fins acadêmicos e de demonstração.
