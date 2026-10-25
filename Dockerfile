FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

# Copiar primero solo el pom.xml para descargar dependencias y cachearlas
COPY pom.xml .
RUN mvn dependency:go-offline

# Luego copiar el código fuente y compilar
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
