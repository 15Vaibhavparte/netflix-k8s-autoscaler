# Use a lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install the Node.js dependencies
RUN npm install

# Copy the rest of the backend code (server.js)
COPY . .

# Expose port 5000 for the Node server
EXPOSE 5000

# Start the backend application
CMD ["node", "server.js"]