# Base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application source code
COPY . .

# Copy the .env and .env.development files
COPY .env .env.development ./

# Build production files
RUN npm run build

# Expose the correct port
EXPOSE 8000

# Start the server
CMD ["npm", "run", "start"]
