#!/bin/bash
sudo rm -r parts/ prime/ stage/
sudo SNAPCRAFT_BUILD_ENVIRONMENT=host snapcraft -v
