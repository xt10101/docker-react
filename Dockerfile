#This gives this stage a name, builder. This is useful in multi-stage builds where you might later copy files from this stage into another final stage using:
FROM node:lts-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html