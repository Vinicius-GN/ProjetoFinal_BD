# ProjetoFinal_BD

Este repositório contém o código do projeto FINAL de banco de dados da disciplina de Banco de Dados do ICMC-USP do grupo 15.

## Merx

O modelo entidade relacionamento estendido pode ser encontrado em [/MERX-DIAGRAM.jpg](https://github.com/Vinicius-GN/ProjetoFinal_BD/blob/main/MERX-DIAGRAM.jpg)

## Comandos úteis para o banco de dados

> Caso já tenha rodado esse banco de dados anteriormente (ou algum container com nome `postgres_db`), você precisa remover o container antes de rodar os próximos. Para isso, use o comando abaixo:

```bash
docker rm -f postgres_db
```

Para iniciar o banco de dados (PostgreSQL):

```bash
docker run -d \
  --name postgres_db \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_DB=postgres \
  -v postgres_data_t2:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres
```

> Para utilizar esse comando, você tem que ter removido o container com o comando anterior.

### Acessando o banco de dados

Para rodar um script SQL no banco de dados:

```bash
docker exec -i postgres_db psql -U postgres -d postgres < ./script.sql
```

### Iniciando o schema e populando a base de dados

```bash
docker exec -i postgres_db psql -U postgres -d postgres < ./schema.sql
```

```bash
docker exec -i postgres_db psql -U postgres -d postgres < ./populate.sql
```

Para acessar o banco de dados com `psql`:

```bash
docker exec -it postgres_db psql -U postgres
```

Para reiniciar a base do zero:

```bash
docker stop postgres_db
docker volume rm postgres_data_t2
docker rm -f postgres_db
```

## Opcional: Usar algum visualizador

Para acessar o banco de dados com um cliente gráfico (DBeaver, pgAdmin, etc.), use as seguintes configurações:

- Host: localhost
- Porta: 5432
- Usuário: postgres
- Senha: postgres
