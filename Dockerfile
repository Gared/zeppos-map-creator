FROM debian:trixie-slim@sha256:62bd423aeee912639ca8ee681c2b762cb3e25137e0a92b20be455898a9f034ad

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
  && git -C /opt/Gadgetbridge-tools fetch --depth 1 origin 268eabb9269b1c53cca6a01a499c4205db1dd5cb \
  && git -C /opt/Gadgetbridge-tools checkout --detach FETCH_HEAD

WORKDIR /data

ENTRYPOINT ["python3", "/opt/Gadgetbridge-tools/zeppos/create_maps/create_zeppos_map.py"]
CMD ["--help"]
