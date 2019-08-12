FROM ubuntu:19.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get install -y --no-install-recommends locales python3 wget ca-certificates unzip &&\
    sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen
ENV LC_ALL en_US.UTF-8

RUN mkdir /grammalecte
WORKDIR /grammalecte
RUN wget https://grammalecte.net/grammalecte/zip/Grammalecte-fr-v1.3.0.zip
RUN unzip Grammalecte-fr-v1.3.0.zip && rm -f Grammalecte-fr-v1.3.0.zip

EXPOSE 8080

CMD python3 grammalecte-server.py --host 0.0.0.0 --port 8080
