FROM eclipse-temurin:21-jdk-jammy

LABEL author="Josscoder" maintainer="josscoder@brawn.cloud"

RUN apt-get update && apt-get install -y lsof curl ca-certificates openssl git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 jq && useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
