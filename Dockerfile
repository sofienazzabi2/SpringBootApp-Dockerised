FROM openjdk:17-slim as build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM openjdk:17-slim
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT [ "java","-jar","/app.jar" ]