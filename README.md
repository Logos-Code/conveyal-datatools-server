# Transit Data Manager

The core application for IBI Group's transit data tools suite.

## Documentation

View the [latest documentation](http://conveyal-data-tools.readthedocs.org/en/latest/) at ReadTheDocs.

Note: `dev` branch docs can be found [here](http://conveyal-data-tools.readthedocs.org/en/dev/).

## How to start application (backend + frontend)

1. Build and start the backend
    1. Download from 1password the file `WRI-CONVEYAL-GTFS: env.yml (prod)` and place it at `./configurations/default/env.yml`
    2. Download from 1password the file `WRI-CONVEYAL-GTFS: server.yml (prod)` and place it at `./configurations/default/server.yml`
    2. Run:
        ```sh
        make build
        make run
        ```
2. Start `conveyal-datatools-ui`

## How to deploy

1. Download from 1password the file `WRI-CONVEYAL-GTFS: env.yml (prod)` and place it at `./configurations/default/env.yml`
2. Download from 1password the file `WRI-CONVEYAL-GTFS: server.yml (prod)` and place it at `./configurations/default/server.yml`
3. Install the [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
4. Setup your aws credentials
    1. Run `aws configure --profile wri-prod`
    2. Grab the values from 1password item `aws - wri-prod`
    3. Example: 
        ```
        AWS Access Key ID [None]: AKI...
        AWS Secret Access Key [None]: Ux...
        Default region name [None]: 
        Default output format [None]: 
        ```
3. Run `make deploy-wri-prod`