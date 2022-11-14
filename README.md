# Transit Data Manager

The core application for IBI Group's transit data tools suite.

## Documentation

View the [latest documentation](http://conveyal-data-tools.readthedocs.org/en/latest/) at ReadTheDocs.

Note: `dev` branch docs can be found [here](http://conveyal-data-tools.readthedocs.org/en/dev/).

## How to start application (backend + frontend)

1. Create a tunnel to communicate with the postgres DB (AWS RDS)
    1. Edit your host file adding:
        ```
        # WRI GTFS
        127.0.0.1 wri-conveyal-gtfs.cjgejhnxhoup.us-east-1.rds.amazonaws.com
        ```
    2. Download from 1password the file `wri-conveyal-gtfs-api.pem`
    3. Run:
        ```sh
        make db-tunnel
        ```
2. Build and start the backend
    1. Download from 1password the file `WRI-CONVEYAL-GTFS: env.yml (prod)` and place it at `./configurations/default/env.yml`
    2. Run:
        ```sh
        make build
        make run
        ```
3. Start `conveyal-datatools-ui`
