FROM beverlyguillermo/rubynode:13-2.6.5

RUN apk add --update build-base
RUN apk add --no-cache --virtual .build-deps \
    bash \
    curl \
    libcurl \
    postgresql-client \
    postgresql-dev \
    python \
    tzdata

ENV BUNDLE_PATH=/bundle \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir -p /srv/rails/web
WORKDIR /srv/rails/web
