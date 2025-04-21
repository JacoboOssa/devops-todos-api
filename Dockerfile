# Use an official Node.js runtime as a parent image
# Based on the README, Node v8.17.0 is recommended
FROM node:8.17.0-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install app dependencies
# Use --only=production if you don't need devDependencies
RUN npm install

# Bundle app source
COPY . .

# The README mentions TODO_API_PORT, default to 8082 as used in the example run command
EXPOSE 8082

# Define the command to run the app
CMD [ "npm", "start" ]

# Note: The following environment variables need to be set at runtime:
# JWT_SECRET
# TODO_API_PORT (defaults to 8082 if not set, but can be overridden)
# REDIS_HOST
# REDIS_PORT
# REDIS_CHANNEL
