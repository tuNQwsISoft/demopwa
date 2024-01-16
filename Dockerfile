# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install
RUN npm install -g serve

# Copy the remaining application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the app will run on
EXPOSE 3000

# Define the command to run the application
CMD ["serve", "-s", "build", "--ssl-cert", "'.cert/cert.pem'", "--ssl-key", "'.cert/cert-key.pem'"]