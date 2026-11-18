FROM debian:trixie-slim@sha256:a72b4433de1cf7d6bae0c4cee74d0547f58601a643b3375f070c51600d63b6b2

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    default-jre-headless \
    mkgmap mkgmap-splitter \
    python3 python3-venv python3-pip \
    python3-shapely python3-pyproj python3-requests python3-lxml \
    osmium-tool osmctools \
    ca-certificates wget unzip git \
  && rm -rf /var/lib/apt/lists/*

RUN git init /opt/Gadgetbridge-tools \
  && git -C /opt/Gadgetbridge-tools remote add origin https://codeberg.org/Freeyourgadget/Gadgetbridge-tools.git \
  && git -C /opt/Gadgetbridge-tools fetch --depth 1 origin 4e4a6512ce0886446c94129bb4be0845f5ea09da \
  && git -C /opt/Gadgetbridge-tools checkout --detach FETCH_HEAD

WORKDIR /data

ENTRYPOINT ["python3", "/opt/Gadgetbridge-tools/zeppos/create_maps/create_zeppos_map.py"]
CMD ["--help"]
