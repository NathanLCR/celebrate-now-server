FROM node:alpine
WORKDIR /app
COPY package*.json ./
COPY prisma ./prisma/
COPY .env ./
COPY tsconfig.json ./
COPY . .
RUN npm install
RUN npx prisma generate
EXPOSE 3000
RUN npm run build
CMD ["npm", "run", "start:watch"]