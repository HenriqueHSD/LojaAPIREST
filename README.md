# Loja API REST

Um sistema de compra de produto em uma loja, desenvolvido no curso de JAVA do Nelio Alves, onde ele 
retorna um JSON, com informação do produto, qual sua categoria, ordem de pedido e o seu cliente.

## 📋 Pré-requisitos

```
Java 17 ou 21
Postman
IDE Intellij ou Eclipe
```

## ⚙️ Executando os testes

Iniciar o Prgrama na sua IDE da sua escolha e utilizer o Postman para fazer os seguintes teste.

### 👨‍💼 Teste no usuario

No usuario podemos consulta todos os usuarios, consulta apenas um usuario pelo seu id,
inserir novo usuario, deletar usuario a parti do seu id, e alterar a parti do seu id.
***
No Postman usar os seguintes comandos para visualizar os dados.

```
GET http://localhost:8080/users - todos os usarios
GET http://localhost:8080/users/1 - usuario pelo id
```
#### Exemplo: 

Todos os usuario

![usuarioAll](imagemProjeto/usuarioAll.png)

Usuario pelo ID:

![usuarioId](imagemProjeto/usuarioId.png)

No Postman usar os seguintes comandos para inserir os dados.

```
POST http://localhost:8080/users
```

 📋 Configurar o Postman para inserir dados

Body
```
{
"name": "Bob Brown",
"email": "bob@gmail.com",
"phone": "977557755",
"password": "123456"
}
```

Headers

| Key             | Value            |
|-----------------|------------------|
| Content-Type | application/json |

#### Exemplo:

![imagemInserir](imagemProjeto/usuarioInserir1.png)

![imagemInserir2](imagemProjeto/usuarioInserir2.png)

No Postman usar os seguintes comandos para alterar os dados.

```
PUT http://localhost:8080/users/1

{
"name": "Mario Bros ",
"email": "mariobros@gmail.com",
"phone": "567895645"
}
```

#### Exemplo:

![imagemAlterando](imagemProjeto/usuarioAlterar1.png)

![imagemAlterando2](imagemProjeto/usuarioAlterar2.png)

No Postman usar os seguintes comandos para deletar os dados.

```
DELETE http://localhost:8080/users/3
```
#### Exemplo:

![imagemDelete](imagemProjeto/usuarioInserir2.png)

![imagemDelete2](imagemProjeto/usuarioDelete.png)

![imagemDelete3](imagemProjeto/usuarioAll.png)

### 📦 Teste no Produto

No produto podemos consulta todos os produtos, consulta apenas um produto pelo seu id
***

```
GET http://localhost:8080/products - todos os produtos
GET http://localhost:8080/products/1 - produto pelo id
```
#### Exemplo:

Todos os produtos:

![imagemProdutoAll](imagemProjeto/produtoAll.png)

Produto pelo ID:

![imagemProdutoId](imagemProjeto/produtoId.png)

### 🛒 Teste no Ordem

No Ordem podemos consulta todas as comprar ser foi finalizado, seu total de comprar, e seu cliente associado,
consulta apenas uma ordem de compar pelo seu id
***

```
GET http://localhost:8080/orders - todas as ordem de comprar
GET http://localhost:8080/orders/1 - order de compra pelo id
```
#### Exemplo:

![imagemOrdem](imagemProjeto/Ordem.gif)

### 🔖 Teste na Categoria

No categoria podemos consulta todas as categoria,
consulta apenas uma categoria pelo seu id
***

```
GET http://localhost:8080/categoryes - todas as categorias
GET http://localhost:8080/categoryes/1 - categoria pelo id
```
#### Exemplo:

Todas as categorias:

![imagemCategoriaAll](imagemProjeto/categoriaAll.png)

Categoria pelo ID:

![imagemCategoriId](imagemProjeto/categoriaId.png)


## 🛠️ Construído com

* Java - liguagem de programação
* Spring boot - framework
* H2 - banco de dados de teste




