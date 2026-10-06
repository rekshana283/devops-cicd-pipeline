#!/bin/bash

CURRENT_IMAGE="devops-simulation:latest"
PREVIOUS_IMAGE="devops-simulation:previous"

echo "Starting rollback..."

if docker image inspect "$PREVIOUS_IMAGE" > /dev/null 2>&1; then
    docker tag "$PREVIOUS_IMAGE" "$CURRENT_IMAGE"
    echo "Rollback completed successfully."
else
    echo "Rollback failed: previous image not found."
    exit 1
fi
