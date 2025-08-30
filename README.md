# Fullstack Docker Project

A containerized full-stack application with React frontend and Node.js backend.

## Tech Stack

- **Frontend**: React (Create React App)
- **Backend**: Express.js with Nodemon
- **Database**: Supabase
- **Containerization**: Docker
- **Environment**: Development & Production configs

## Project Structure

```
fullstack-project/
├── client/                 # React frontend
│   ├── Dockerfile.dev     # Development Docker config
│   ├── public/            # Static assets
│   └── src/              # React source code
├── server/                # Express backend
│   ├── Dockerfile.dev    # Development Docker config
│   ├── index.js         # Server entry point
│   └── nodemon.json     # Nodemon configuration
├── docker-compose.yml    # Development orchestration
├── Dockerfile           # Production build
└── .dockerignore       # Docker ignore rules
```

## Quick Start

1. Clone the repository
2. Create `.env` in root:
```env
PORT=5050
NODE_ENV=development
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

3. Create `client/.env`:
```env
REACT_APP_SUPABASE_URL=your_supabase_url
REACT_APP_SUPABASE_ANON_KEY=your_supabase_anon_key
```

4. Start development environment:
```bash
docker-compose up --build
```

## Development

- Frontend runs on: http://localhost:3000
- Backend runs on: http://localhost:5050
- Hot reload enabled for both services

### Available Commands

```bash
# Start development environment
docker-compose up --build

# Stop services
docker-compose down

# View logs
docker-compose logs -f

# Rebuild specific service
docker-compose up --build client
docker-compose up --build server
```

## Production

Build and run production version:

```bash
# Build production image
docker build -t fullstack-app .

# Run production container
docker run -p 5050:5050 fullstack-app
```

## Features

- ✅ Hot reload development environment
- ✅ Supabase integration ready
- ✅ Production-optimized builds
- ✅ Environment-specific configurations
- ✅ Docker best practices implemented

## Environment Variables

### Backend (.env)
- `PORT`: Server port (default: 5050)
- `NODE_ENV`: Environment mode
- `SUPABASE_URL`: Supabase project URL
- `SUPABASE_ANON_KEY`: Supabase anonymous key

### Frontend (client/.env)
- `REACT_APP_SUPABASE_URL`: Supabase project URL
- `REACT_APP_SUPABASE_ANON_KEY`: Supabase anonymous key

## Troubleshooting

- **Port conflicts**: Change ports in docker-compose.yml
- **Hot reload issues**: Check CHOKIDAR_USEPOLLING in Dockerfiles
- **Build failures**: Verify .dockerignore configuration
- **Module not found**: Rebuild node_modules with `docker-compose up --build`