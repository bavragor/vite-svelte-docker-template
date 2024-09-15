#!/bin/bash

# Check if .env.dist file exists
if [ ! -f .env.dist ]; then
  echo ".env.dist file not found!"
  exit 1
fi

# Copy .env.dist to .env
cp .env.dist .env

# Get the current user's UID and GID
USER_UID=$(id -u)
USER_GID=$(id -g)

# Replace placeholders in .env with actual UID and GID
sed -i "s/UID=.*$/UID=${USER_UID}/" .env
sed -i "s/GID=.*$/GID=${USER_GID}/" .env

echo ".env file has been created and updated with UID and GID."