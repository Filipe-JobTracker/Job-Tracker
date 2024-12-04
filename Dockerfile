FROM node:20-alpine
LABEL authors="filipe"
ENV NODE_ENV=production

WORKDIR /app
COPY ./frontend /app/frontend
COPY ./backend /app/backend
COPY ./entrypoint.sh /usr/bin/entrypoint

RUN chmod +x /usr/bin/entrypoint

RUN apk update && apk add bash && cd /app/frontend && npm install && npm run build &&  \
    cd /app/backend && npm install && npx prisma generate && npm run build

ENTRYPOINT ["sh", "-c", "PORT=${PORT:-3000} /usr/bin/entrypoint"]