# Use Node.js LTS version as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the entire project files to the container
COPY . .

# Build the React application for production
RUN npm run build

# Install a lightweight static server (serve) globally
RUN npm install -g serve

# Expose port 3000 (to match your Kubernetes configuration)
EXPOSE 3000

# Start the React app on port 3000
CMD ["serve", "-s", "build", "-l", "3000"]
