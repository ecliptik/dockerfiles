#!/bin/bash

#Run HandbrakeCLI in a container
# Defaults to x265 encoding, quality 22, framerate 23.976, 1080p resolution, optimized for web, two-pass, turbo-mode, subtitles
docker run -t --rm -d \
  --entrypoint=HandBrakeCLI \
  -v ~/git/dockerfiles/makemkv/makemkv/:/handbrake ecliptik/handbrake \
  -e x265 \
  -q 22 \
  -r 23.976 \
  -B 256 \
  -X 1920 \
  -Y 1080 \
  -O \
  -2 \
  -T \
  -s scan \
  --subtitle-forced \
  -i /handbrake/Beauty_And_The_Beast_2014.mkv \
  -o /handbrake/Beauty_And_The_Beast_2014.mp4
