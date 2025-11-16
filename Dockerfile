FROM debian:trixie-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    default-jre-headless \
    mkgmap mkgmap-splitter \
    python3 python3-venv python3-pip \
    python3-shapely python3-pyproj python3-requests python3-lxml \
    osmium-tool osmctools \
    ca-certificates wget unzip git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://codeberg.org/Freeyourgadget/Gadgetbridge-tools.git /opt/Gadgetbridge-tools

WORKDIR /data

ENTRYPOINT ["python3", "/opt/Gadgetbridge-tools/zeppos/create_maps/create_zeppos_map.py"]
CMD ["--help"]
