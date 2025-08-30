# Build frontend
FROM node:18-alpine as frontend-build
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

# Build backend
FROM node:18-alpine as backend-build
WORKDIR /app/server
COPY server/package*.json ./
RUN npm install --only=production

# Final stage
FROM node:18-alpine
WORKDIR /app

# Copy backend
COPY --from=backend-build /app/server ./
COPY server/ ./

# Copy frontend build
COPY --from=frontend-build /app/client/build ./public

# Serve frontend from backend
RUN npm install express-static

EXPOSE 5000

CMD ["npm", "start"]