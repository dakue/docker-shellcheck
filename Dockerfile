FROM debian:wheezy

RUN set -x && \ 
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y cabal-install ghc git-core ca-certificates && \
  git clone https://github.com/koalaman/shellcheck.git && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["shellcheck"]
