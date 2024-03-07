# data-engineering-with-dbt-linkedin-learning
Course material from "Data Engineering with DBT" from Mark Freeman.

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
