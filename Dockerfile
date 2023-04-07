FROM amazoncorretto:8u362-alpine3.17-jre

USER root

COPY ./entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
