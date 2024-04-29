FROM ubuntu:latest

COPY ./entrypoint.sh /entrypoint.sh

RUN ./entrypoint.sh

CMD ["/bin/bash"]

