FROM openjdk:11-jdk
#FROM openjdk:8-jre-alpine
ENV SERVER_PORT=5885
EXPOSE $SERVER_PORT
#RUN apt-get update && apt-get install -y telnet
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
WORKDIR /web
ARG JAR_FILE
COPY target/app.jar app.jar
RUN echo "java -jar app.jar -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap" > start.sh ; chmod +x start.sh
#CMD [ "sh", "-c", "./start.sh" ]
ENTRYPOINT ["sh", "-c", "./start.sh"]