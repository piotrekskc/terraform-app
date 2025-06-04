# Frontend Dockerfile
FROM node:20-alpine as build
WORKDIR /app
COPY my-python-app/frontend/package.json ./
COPY my-python-app/frontend/package-lock.json ./
COPY my-python-app/frontend/src ./src
COPY my-python-app/frontend/public ./public
RUN npm install -g serve && npm install && npm run build || true

FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/public ./public
EXPOSE 3000
CMD ["npx", "serve", "-s", "public", "-l", "3000"]
