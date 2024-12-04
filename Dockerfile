FROM node:20-alpine
LABEL authors="filipe"
ENV NODE_ENV=production

COPY ./frontend /app/frontend
COPY ./backend /app/backend
COPY ./entrypoint.sh /usr/bin/entrypoint

RUN chmod +x /usr/bin/entrypoint

RUN apk update --no-cache && apk --no-cache add bash

WORKDIR /app/frontend
RUN cd /app/frontend && npm install && npm run build

WORKDIR /app/backend
RUN cd /app/backend && npm install && npx prisma generate && npm run build

WORKDIR /app

ENTRYPOINT ["sh", "-c", "PORT=${PORT:-3000} /usr/bin/entrypoint"]