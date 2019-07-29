FROM circleci/python

USER root

ARG AZURE_CLI_VERSION=2.0.69

COPY .certs /usr/local/share/ca-certificates/
RUN update-ca-certificates
ENV REQUESTS_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt

RUN pip install azure-cli==${AZURE_CLI_VERSION}

USER circleci

WORKDIR /usr/local/lib