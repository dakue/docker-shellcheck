FROM debian:wheezy

ENV SHELLCHECK_VERSION 0.4.3

RUN set -x && \ 
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y cabal-install ghc curl ca-certificates && \
  mkdir -p /shellcheck && \
  curl -sSL https://github.com/koalaman/shellcheck/archive/v${SHELLCHECK_VERSION}.tar.gz | \
  tar xz --strip-components=1 -C /shellcheck && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["shellcheck"]
