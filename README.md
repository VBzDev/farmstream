# FarmStream
###### Este é o arquivo README para o projeto FarmStream. Siga os passos abaixo para configurar e executar o projeto.

### Configuração
##### Crie um arquivo .env (utilize o .env.example) na raiz do projeto e adicione sua chave de acesso à API do YouTube com a seguinte variável de ambiente

##### Crie os containers do Docker:
`docker-compose build`
##### Inicie os containers:
`docker-compose up`
### Banco de Dados
##### Crie o banco de dados:
`docker exec -it farmstream-web-1 bin/rails db:create`
##### Execute as migrações:
`docker exec -it farmstream-web-1 bin/rails db:migrate`
##### Acesso
Acesse o projeto em `localhost:3000/rooms`.