FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN chown -R node /app/node_modules

RUN npm run build


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html