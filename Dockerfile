FROM ubuntu:focal

ENV STEAMROOT /opt/Steam

RUN set -x; \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get -o APT::Immediate-Configure=off install -y --no-install-recommends \
    lib32gcc1 \
    libc6:i386 \
    libstdc++6:i386 \
    libsdl2-2.0-0:i386 \
    wget \
    ca-certificates \
    locales && \
  sed -E 's;^# (en_US\.UTF-8.*)$;\1;g' -i /etc/locale.gen && \
  locale-gen && \
  ln -s "${STEAMROOT}/linux32/steamclient.so" /usr/lib/i386-linux-gnu && \
  ln -s "${STEAMROOT}/linux64/steamclient.so" /usr/lib/x86_64-linux-gnu && \
  rm -rf /var/lib/apt/lists

COPY entrypoint.sh /usr/local/bin/entrypoint-steamcmd.sh

ENTRYPOINT ["entrypoint-steamcmd.sh"]

CMD ["/bin/bash"]
