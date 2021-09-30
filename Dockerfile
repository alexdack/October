FROM node:alpine
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
# CREATE STATIC ASSETS
RUN npm run build

EXPOSE 80
FROM nginx 
COPY --from=0 /app/build /usr/share/nginx/html

