FROM node:19-alpine3.15 as dev-deps

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile


FROM node:19-alpine3.15 as builder

WORKDIR /app

COPY --from=dev-deps /app/node_modules ./node_modules

COPY . .

RUN yarn build

FROM nginx:1.23.2 as prod

COPY --from=builder /app/dist /usr/share/nginx/html
COPY assets /usr/share/nginx/html/assets
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/ngix.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

