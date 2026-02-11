FROM python:3.8-slim-bookworm

ENV PATH /usr/local/lib/python3.8/site-packages:$PATH

RUN apt-get update && apt-get install -y gcc python3-dev wget && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /requirements.txt

COPY run.sh /run.sh

RUN apt update
RUN apt install wget -y

RUN pip3 install -r requirements.txt
COPY . .

RUN chmod u+x run.sh

RUN wget -q --tries=10 https://www.calebjay.com/ocremix.csv -O ocremix.csv

ENTRYPOINT [ "/run.sh" ]