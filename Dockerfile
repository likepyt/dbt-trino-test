FROM --platform=linux/amd64 python:3.10-slim-buster

RUN apt-get update \
    && apt-get install -y --no-install-recommends

WORKDIR /usr/src/dbt

# Install the dbt Postgres adapter. This step will also install dbt-core
RUN pip install --upgrade pip
RUN python -m pip install dbt-postgres dbt-trino
RUN pip install pytz

RUN echo "test"

# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models and snapshots (and run tests wherever applicable)
CMD dbt init jaffle_shop && sleep infinity
