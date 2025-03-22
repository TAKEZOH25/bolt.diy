FROM node:20-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm && pnpm install

COPY . .

RUN pnpm run build
RUN npm install -g serve

EXPOSE 5173

ENV RUNNING_IN_DOCKER=true

CMD ["serve", "-s", "build/client", "-l", "5173"]
