FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
# next line is used by AWS
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# no need to start nginx, this image already starts it by default


