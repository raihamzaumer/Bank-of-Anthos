# ---- build stage ----
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml checkstyle.xml ./
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 \
    mvn -B -q package -DskipTests

# ---- runtime stage ----
FROM eclipse-temurin:17-jre-alpine
RUN addgroup -S app && adduser -S -G app -u 10001 app
WORKDIR /app
COPY --from=build /build/target/ledgerwriter-1.0.jar app.jar
ENV JVM_OPTS="-XX:MaxRAMPercentage=75.0"
USER 10001
EXPOSE 8080
ENTRYPOINT ["sh", "-c", "exec java $JVM_OPTS -jar /app/app.jar"]