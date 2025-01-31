FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Expose the application port
EXPOSE 8081

# Start the application
CMD ["npm", "run", "start:prod"]
