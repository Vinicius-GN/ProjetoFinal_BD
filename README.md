# ProjetoFinal_BD

Este repositório contém o código do projeto FINAL de banco de dados da disciplina de Banco de Dados do ICMC-USP.

## Comandos úteis para o banco de dados

Para iniciar o banco de dados (PostgreSQL):

```bash
docker run -d \
  --name postgres_db \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_DB=postgres \
  -v postgres_data_v2:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres
```

> Caso já tenha rodado o banco de dados anteriormente, você precisa remover o container antes de rodar o comando acima. Para isso use os comando abaixos:

Para parar e remover o banco de dados:

```bash
docker rm -f postgres_db
```

Para remover o volume (reiniciar os dados do zero)

```bash
docker rm postgres_data
```

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

## Opcional: Usar algum visualizador

Para acessar o banco de dados com um cliente gráfico (DBeaver, pgAdmin, etc.), use as seguintes configurações:

- Host: localhost
- Porta: 5432
- Usuário: postgres
- Senha: postgres