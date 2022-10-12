FROM node:16-alpine AS builder
ENV NODE_ENV dev
WORKDIR /app
COPY ./package.json ./yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

FROM node:16-alpine AS runner
WORKDIR /app
ENV NODE_ENV production
COPY ./package.json ./yarn.lock ./
RUN yarn
COPY . .
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
EXPOSE 3000
ENV PORT 3000
CMD [ "npm", "run", "start"]