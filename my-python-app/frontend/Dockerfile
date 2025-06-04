# Frontend Dockerfile
FROM node:20-alpine as build
WORKDIR /app
COPY ./src ./src
COPY ./public ./public
RUN npm install -g serve && npm install && npm run build || true

FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/public ./public
EXPOSE 3000
CMD ["npx", "serve", "-s", "public", "-l", "3000"]
