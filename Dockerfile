FROM node:20
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

COPY . .

RUN npm run build

WORKDIR /data

ENTRYPOINT ["node", "/app/index.js"]
