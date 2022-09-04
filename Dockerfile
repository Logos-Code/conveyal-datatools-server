FROM maven:3.8.6-amazoncorretto-8

WORKDIR /app

COPY . .

CMD mvn -DskipTests '-Dproject.finalName=wri-conveyal-gtfs-server' package
