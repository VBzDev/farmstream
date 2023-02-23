# FarmStream
Este é o arquivo README para o projeto FarmStream. Siga os passos abaixo para configurar e executar o projeto.

## Configuração do Ambiente

1. Crie um arquivo .env (utilize o .env.example) na raiz do projeto e adicione sua chave de acesso à API do YouTube com a seguinte variável de ambiente

2. Crie os containers do Docker:
`docker-compose build`

3. Inicie os containers:
`docker-compose up`
## Banco de Dados

1. Crie o banco de dados:
`docker exec -it farmstream-web-1 bin/rails db:create`

2. Execute as migrações:
`docker exec -it farmstream-web-1 bin/rails db:migrate`
## Acesso
Acesse o projeto em `localhost:3000/rooms`.