# ---------- FRONTEND BUILD ----------
FROM node:20-alpine AS frontend-build
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

# ---------- BACKEND BUILD ----------
FROM node:20-alpine AS backend-build
WORKDIR /app
COPY server/package*.json ./
RUN npm install --only=production
COPY server/ ./

# ---------- FINAL IMAGE ----------
FROM node:20-alpine
WORKDIR /app

# Copy backend code + node_modules
COPY --from=backend-build /app ./

# Copy frontend build into backend's public folder
COPY --from=frontend-build /app/client/build ./public

ENV NODE_ENV=production
ENV PORT=5050
EXPOSE 5050

CMD ["node", "server.js"]