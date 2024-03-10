# Data Engineering with DBT (Linkedin Learning)
Course material from ["Data Engineering with DBT"](https://www.linkedin.com/learning/data-engineering-with-dbt/) from Mark Freeman.

## Creating development environment with Poetry
First, make sure Poetry is installed.
```bash
curl -sSL https://install.python-poetry.org | python3 -
poetry --version
```

Next, change directory to your repository folder and initialize Poetry.
```bash
poetry init
```

Now you have Poetry taking care of your working environment and dependencies.

## Installing DBT and DuckDB
Next, we want to install DBT and DuckDB.
```bash
poetry add dbt-core dbt-duckdb duckdb
```
The first and last names are related to DBT and DuckDB, while `dbt-duckdb` is the connector for DBT to DuckDB.

## Using JupyterLab to test code
In order to test commands while developing the project, we are going to use JupyterLab as it offers an interactive IDE suited for our needs.
```bash
poetry add jupyterlab
```
And to access it on your browser [localhost:8888](localhost:8888).
```
poetry run jupyter lab
```

## Initializing DBT project
To initialize a DBT project, we need to use the `init` command.
```bash
dbt init
```
Just add a relevant name for your DBT project (we named it `nyc_parking_violations`) and choose DuckDB as the database (type `1`).

## Creating a config profile file for DuckDB
There is one more file we need to create for the DuckDB-DBT profile, in the following path `nyc_parking_violations/profiles.yml` and add this information.

```yaml
nyc_parking_violations:
  outputs:
    dev:
      type: duckdb
      path: '../data/nyc_parking_violations.db'
  target: dev
```

## Adding new SQL models to the project
With our project ready, we can start creating SQL models. We are going to start simple, just to have an understanding of the structure of files and folders. Let's create our first model as `models/first_model.sql`.
```sql
select *
from parking_violation_codes
```

## Running DBT commands through the CLI
After creating our first SQL model, we can use DBT CLI to validate our project structure.
```bash
dbt debug
```
The `debug` checks for erros on your DBT project.

```bash
dbt compile
```
Next, `compile` can help you check if your SQL models have errors, before running it.

```bash
dbt run
```
And finally, `run` to compile and execute all SQL models.

## Using `ref` inside models
One easy way to reference sql models is by using the `ref` statement on your DBT queries.
```sql
select
  count(1) qty
from
  {{ref('first_model')}}
```
The query above references the `first_model` as it was a CTE.

## Creating documentations with DBT docs
DBT offers a easy way to generate project documentation. After executing the command bellow, all the documentation metadata is stored as JSON files inside `/target/catalog.json`.
```bash
dbt docs generate
```
And you can access an interactive server with `docs serve` command.
```bash
dbt docs serve
```

## Materialization on DBT
Study this documentation
- [Materializations](https://docs.getdbt.com/docs/build/materializations)
