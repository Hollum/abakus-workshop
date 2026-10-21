# Abakus workshop

## Local PostgreSQL

Run these commands from the folder that contains `Dockerfile`.
Docker must be installed and running.
If you use Docker Desktop, start Docker Desktop.
If you use Colima, run `colima start`.

A Docker image contains the files needed to run PostgreSQL.
A container runs that image.

Build the database image:

```sh
docker build -t abakus-postgres .
```

A Docker volume stores data separately from the container.
The `-v` flag below stores database data in the `abakus-postgres-data` volume.
The password below is for local development.

Start PostgreSQL:

```sh
docker run -d \
  --name abakus-postgres \
  -p 127.0.0.1:5432:5432 \
  -e POSTGRES_PASSWORD=local-dev-password \
  -v abakus-postgres-data:/var/lib/postgresql \
  abakus-postgres
```

Make sure that the database is ready:

```sh
docker exec abakus-postgres pg_isready -U abakus -d abakus_workshop
```

Before you connect, wait for `accepting connections`.
If startup fails, read the output of `docker logs abakus-postgres`.

Use this connection URL (the database address and login details):

```text
postgresql://abakus:local-dev-password@localhost:5432/abakus_workshop
```

A SQL shell lets you type database commands.
To open one inside the container, run:

```sh
docker exec -it abakus-postgres psql -U abakus -d abakus_workshop
```

To stop the existing container, run `docker stop abakus-postgres`.
To start it again, run `docker start abakus-postgres`.
The volume keeps your data even if you remove the container.

For a new database, use the `-e` flag to change `POSTGRES_DB`, `POSTGRES_USER`, or `POSTGRES_PASSWORD`.
These configuration values apply only when the data volume is empty.
They do not update an existing database.

## Postgres MCP server

MCP (Model Context Protocol) connects AI applications to tools.
An MCP client is an application that uses those tools.
The Postgres MCP server gives the client access to PostgreSQL.

Install [uv](https://docs.astral.sh/uv/getting-started/installation/) to get the `uvx` command.
Start the database with the commands above.
Open this project folder in an MCP client that supports `.mcp.json`.
Enable the `postgres` server in that client.

The client runs `uvx postgres-mcp --access-mode=unrestricted` with the connection URL from `.mcp.json`.
After you change `.mcp.json`, restart or reconnect the MCP server in your client.
If your client stores configuration elsewhere, copy the `postgres` entry into its `mcpServers` configuration.

To run the MCP server manually in a terminal:

```sh
DATABASE_URI='postgresql://abakus:local-dev-password@localhost:5432/abakus_workshop' \
  uvx postgres-mcp --access-mode=unrestricted
```

The server uses stdio (standard input and output) to communicate with an MCP client.
It does not open a web page.
For normal use, let your MCP client start the server automatically.

See the [Postgres MCP documentation](https://github.com/crystaldba/postgres-mcp)
for client configuration details.
