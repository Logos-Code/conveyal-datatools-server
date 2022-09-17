FROM maven:3.8.6-amazoncorretto-8 AS base

WORKDIR /app

FROM base AS build

COPY pom.xml pom.xml

RUN mvn dependency:resolve dependency:resolve-plugins

CMD sh -c "mvn -DskipTests '-Dproject.finalName=wri-conveyal-gtfs-server' package"
