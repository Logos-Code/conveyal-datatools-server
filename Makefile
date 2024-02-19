FINAL_BUILD_NAME=prod
DEPLOY_AUX_DIR=deployment

db-tunnel:
	ssh -N -L 5432:wri-conveyal-gtfs.cjgejhnxhoup.us-east-1.rds.amazonaws.com:5432 -i ./wri-conveyal-gtfs-api.pem ec2-user@wrigtfs.us-east-1.elasticbeanstalk.com

clean:
	sudo rm -rf target

build: down clean
	docker compose build --no-cache backend-build
	docker compose up backend-build

run:
	docker compose up backend

down:
	docker compose down

run-jar:
	java "-Dfile.encoding=UTF-8" -Xmx4G -jar target/wri-conveyal-gtfs-server.jar configurations/default/env.yml configurations/default/server.dev.yml

deploy-wri-prod: build
	rm -rf ${DEPLOY_AUX_DIR}
	mkdir ${DEPLOY_AUX_DIR}
	cp target/wri-conveyal-gtfs-server.jar ${DEPLOY_AUX_DIR}
	cp configurations/default/env.yml ${DEPLOY_AUX_DIR}
	cp configurations/default/server.yml ${DEPLOY_AUX_DIR}
	cp -r .ebextensions ${DEPLOY_AUX_DIR}
	cp -r .platform ${DEPLOY_AUX_DIR}
	echo "web: java -Dfile.encoding=UTF-8 -Xmx4G -jar wri-conveyal-gtfs-server.jar env.yml server.yml" > ${DEPLOY_AUX_DIR}/Procfile
	cd ${DEPLOY_AUX_DIR}; zip -r ${FINAL_BUILD_NAME}.zip * .platform .ebextensions
	aws --profile wri-prod s3 cp ${DEPLOY_AUX_DIR}/${FINAL_BUILD_NAME}.zip s3://wri-conveyal-gtfs-ui/${FINAL_BUILD_NAME}.zip
