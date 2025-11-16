# Zepp OS map creator
This repository contains tools and resources for creating maps for ZeppOS devices. Zepp OS is the operating system used in various smartwatches and fitness trackers.

This project wraps the code of https://codeberg.org/Freeyourgadget/Gadgetbridge-tools into a docker container for easier usage (based on the [instructions from gadgetbridge](https://gadgetbridge.org/basics/topics/zeppos/#maps-upload)).

## Usage
To create a custom map for Zepp OS, follow these steps:
1. Get a pbf file of the area you want to create a map for. You can download pbf files from various sources, such as Geofabrik (see: https://download.geofabrik.de/). Then put the file inside a directory called `data`.
2. Get the center coordinates (latitude and longitude) of the area you want to create a map for
3. Run the docker container with the following command, replacing the placeholders with your actual values:
```bash
docker run --rm -it -v "./data":/data gared/zeppos-map-creator $LATITUDE $LONGITUDE /data/your_data_map_file.osm.pbf
```
Example:
```bash
docker run --rm -it -v "./data":/data gared/zeppos-map-creator 48.137154 11.576124 /data/oberbayern-251115.osm.pbf
```
4. The generated map file will be located in the `data` directory with the name `map<latitude>-<longitude>.zip`. You can then transfer this file to your ZeppOS device.
