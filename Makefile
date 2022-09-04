FINAL_BUILD_NAME=wri-conveyal-gtfs-server
DEPLOY_AUX_DIR=deployment

clean:
	rm -rf target

docker_build: clean
	docker build -t datatools-server:latest .

build: docker_build
	docker run --rm --volume ${PWD}/target:/app/target datatools-server:latest -- mvn -DskipTests '-Dproject.finalName=${FINAL_BUILD_NAME}' package

run: build
	mvn exec:java -Dexec.mainClass="com.conveyal.datatools.manager.DataManager"

run_jar:
	java -Dfile.encoding=UTF-8 -jar target/wri-conveyal-gtfs-server.jar

deploy:
	rm -rf ${DEPLOY_AUX_DIR}
	rm -f ${FINAL_BUILD_NAME}.zip
	mkdir ${DEPLOY_AUX_DIR}
	cp target/wri-conveyal-gtfs-server.jar ${DEPLOY_AUX_DIR}
	cp configurations/default/*.yml ${DEPLOY_AUX_DIR}
	cp -r .ebextensions ${DEPLOY_AUX_DIR}
	cp -r .platform ${DEPLOY_AUX_DIR}
	echo "web: java -Dfile.encoding=UTF-8 -jar wri-conveyal-gtfs-server.jar env.yml server.yml" > ${DEPLOY_AUX_DIR}/Procfile
	cd ${DEPLOY_AUX_DIR}; zip -r ${FINAL_BUILD_NAME}.zip * .platform .ebextensions
	aws s3 cp ${DEPLOY_AUX_DIR}/${FINAL_BUILD_NAME}.zip s3://wri-conveyal-gtfs-ui/${FINAL_BUILD_NAME}.zip