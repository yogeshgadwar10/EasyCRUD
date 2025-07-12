# FROM maven:3.8.3-openjdk-17

# COPY . /opt/

# WORKDIR /opt

# RUN rm -rf src\main\resources\application.properties && \
#     cp -rf application.properties src\main\resources\application.properties

# RUN mvn clean package -DskipTests

# WORKDIR target/

# #ENTRYPOINT ["java","-jar"]
# #CMD ["student-registration-aap.jar"]

# #ENTRYPOINT ["java", "-jar", "app.jar"]
# ENTRYPOINT ["sh", "-c", "java -jar *.jar"]

# ***********************************************

FROM maven:3.8.3-openjdk-17

COPY . /opt/

WORKDIR /opt

# Fix path separators and replace application.properties
#  src/main/resources/application.properties
RUN rm -f \backend\src\main\resources\application.properties
RUN cp -rf \backend\application.properties \backend\src\main\resources\application.properties

# Build the application
RUN mvn clean package -DskipTests

# Find and run the JAR file automatically
WORKDIR /opt/target/

# This will automatically find and run the JAR file
ENTRYPOINT ["java","-jar"]
CMD [ "student-registration-backend-0.0.1-SNAPSHOT.jar" ]

