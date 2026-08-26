
FROM maven:3.9.11-eclipse-temurin-17 AS build

WORKDIR /app


COPY pom.xml .


RUN mvn dependency:go-offline -B


COPY src ./src


RUN mvn clean package -DskipTests -B


FROM eclipse-temurin:17-jre

WORKDIR /app


RUN useradd --system --create-home --shell /usr/sbin/nologin appuser


COPY --from=build /app/target/sample-app-1.0.0.jar app.jar


RUN chown appuser:appuser app.jar


USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]