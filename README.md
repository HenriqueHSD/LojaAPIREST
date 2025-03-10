# Loja API REST

Um sistema de compra de produtos em uma loja, desenvolvido no curso de JAVA do Nelio Alves. Ele retorna um JSON com informações do produto, sua categoria, ordem de pedido e o cliente. Fiz algumas alterações, mudando o banco de dados que inicialmente estava no H2 para PostgreSQL e adicionando autenticação via token.
## 📋 Pré-requisitos

```
Java 21
Postman
IDE Intellij ou Eclipe
PostgresSQL
```
Configure o arquivo `course/src/main/resources/application-dev.properties`:

```
spring.datasource.url=jdbc:postgresql://localhost:5432/{seu banco}
spring.datasource.username={seu nome}
spring.datasource.password={sua senha}
```

## ⚙️ Executando os testes

Inicie o programa na IDE de sua escolha e utilize o Postman para realizar os seguintes testes.

### 🔒 Login de Usuário

No Postman, utilize o seguinte comando para fazer login:

```
POST http://localhost:8080/auth/login
```
**Body:**

**Admin (acesso completo)**

```json
{
"email": "admin@admin.com",
"password": "123456789"
}
```

**User (acesso a ordem, produto e categoria)**

```json
{
"email": "user@user.com",
"password": "12345"
}
```

**Customer (acesso a produto e categoria)**

```json
{
"email": "customer@customer.com",
"password": "123"
}
```
O sistema retornará um token que deverá ser usado em todas as consultas. No Postman, acesse a aba **Authorization**, selecione **Bearer Token** e cole o token.

#### Exemplo:

![login](imagemProjeto/login.png)

![token](imagemProjeto/token.png)


---
### 👨‍💼 Teste no usuario

No usuário, podemos:  
- Consultar todos os usuários  
- Consultar apenas um usuário pelo seu ID  
- Inserir um novo usuário  
- Deletar um usuário a partir do seu ID  
- Alterar um usuário a partir do seu ID  

No Postman, utilize os seguintes comandos para visualizar os dados:

```
GET http://localhost:8080/users - todos os usuários  
GET http://localhost:8080/users/1 - usuário pelo ID 
```
#### Exemplo: 

**Todos os usuários:** 

![usuarioAll](imagemProjeto/usuarioAll.png)

**Usuário pelo ID:**  

![usuarioId](imagemProjeto/usuarioId.png)

No Postman, use o seguinte comando para inserir dados:

```
POST http://localhost:8080/users
```

📝 **Configurar o Postman para inserir dados**

**Body:**
```json
{
  "name": "Bob Brown",
  "email": "bob@gmail.com",
  "phone": "977557755",
  "password": "123456"
}
```

**Headers:**

| Key           | Value               |
|--------------|---------------------|
| Content-Type | application/json    |

#### Exemplo:

![imagemInserir](imagemProjeto/usuarioInserir1.png)

![imagemInserir2](imagemProjeto/usuarioInserir2.png)

No Postman, use o seguinte comando para alterar os dados:

```
PUT http://localhost:8080/users/1
```

**Body:**
```json
{
  "name": "Mario Bros",
  "email": "mariobros@gmail.com",
  "phone": "567895645"
}
```

#### Exemplo:

![imagemAlterando](imagemProjeto/usuarioAlterar1.png)

![imagemAlterando2](imagemProjeto/usuarioAlterar2.png)

No Postman, use o seguinte comando para deletar um usuário:

```
DELETE http://localhost:8080/users/3
```
#### Exemplo:

![imagemDelete](imagemProjeto/usuarioInserir2.png)

![imagemDelete2](imagemProjeto/usuarioDelete.png)

![imagemDelete3](imagemProjeto/usuarioAll.png)

---
### 📦 Teste no Produto

No produto, podemos:  
- Consultar todos os produtos  
- Consultar apenas um produto pelo seu ID

```
GET http://localhost:8080/products - todos os produtos
GET http://localhost:8080/products/1 - produto pelo ID
```

#### Exemplo:

**Todos os produtos:** 

![imagemProdutoAll](imagemProjeto/produtoAll.png)

**Produto pelo ID:** 

![imagemProdutoId](imagemProjeto/produtoId.png)


---
### 🛒 Teste no Ordem

Na ordem, podemos:  
- Consultar todas as compras finalizadas  
- Consultar o total das compras e o cliente associado  
- Consultar apenas uma ordem de compra pelo seu ID  


```
GET http://localhost:8080/orders - todas as ordens de compra
GET http://localhost:8080/orders/1 - ordem de compra pelo ID 
```

#### Exemplo:

![imagemOrdem](imagemProjeto/ordem.gif)

---

### 🔖 Teste na Categoria

Na categoria, podemos:  
- Consultar todas as categorias  
- Consultar apenas uma categoria pelo seu ID  


```
GET http://localhost:8080/categoryes - todas as categorias
GET http://localhost:8080/categoryes/1 - categoria pelo id
```
#### Exemplo:

**Todas as categorias:**  

![imagemCategoriaAll](imagemProjeto/categoriaAll.png)

**Categoria pelo ID:** 

![imagemCategoriId](imagemProjeto/categoriaId.png)

---
## 🛠️ Construído com

* **Java** - Linguagem de programação  
* **Spring Boot** - Framework  
* **H2** - Banco de dados de teste 
* **PostegresSQL** - Banco de dados




