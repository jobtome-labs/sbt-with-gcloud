FROM hseeberger/scala-sbt:8u242_1.3.8_2.12.10

RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    apt-transport-https \
    curl \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update && \
    apt-get install --yes --no-install-recommends \
    google-cloud-sdk && \
    rm -rf /var/lib/apt/lists/*