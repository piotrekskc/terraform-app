# Frontend Dockerfile
FROM node:20-alpine as build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY src ./src
COPY public ./public
RUN npm install -g serve && npm install && npm run build || true

FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/public ./public
EXPOSE 3000
CMD ["sh", "-c", "npx serve -s public -l ${PORT:-3000}"]
