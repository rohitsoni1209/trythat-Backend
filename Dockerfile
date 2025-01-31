FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (include devDependencies for build step)
RUN npm install

# Install NestJS CLI globally
RUN npm install -g @nestjs/cli

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Remove devDependencies after build to reduce image size
RUN npm prune --omit=dev

# Expose the application port
EXPOSE 8081

# Start the application
CMD ["npm", "run", "start:prod"]
