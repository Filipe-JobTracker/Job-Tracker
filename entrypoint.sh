#!/usr/bin/env bash

cd /app/backend || exit 1;


if [[ -f "/app/initialized" ]]; then
  npx prisma migrate deploy;
  touch ../initialized;
fi

node -r tsconfig-paths/register dist/index.js;