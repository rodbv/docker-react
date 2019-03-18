FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# no need to start nginx, this image already starts it by default


