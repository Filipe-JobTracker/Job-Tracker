#!/usr/bin/env bash

cd /app/backend || exit 1;

#if [[ -f "/app/initialized" ]]; then
#  touch ../initialized;
#fi

#npx prisma migrate deploy --name init;
#
#node -r tsconfig-paths/register dist/index.js;

npm run prod