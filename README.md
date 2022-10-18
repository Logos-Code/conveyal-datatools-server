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
        ssh -N -L 5432:wri-conveyal-gtfs.cjgejhnxhoup.us-east-1.rds.amazonaws.com:5432 -i <path-to-wri-conveyal-gtfs-api.pem> ec2-user@wrigtfs.us-east-1.elasticbeanstalk.com
        ```
2. Build and start the backend
    ```sh
    make build
    make run-jar
    ```
3. Start `conveyal-datatools-ui`
