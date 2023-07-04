# Create our image based on Node
FROM node:20

# Create our app base dir
WORKDIR /usr/src/app

# Install all the project dependencies
RUN npm install

# Expose port 8080 to the host system
EXPOSE 8080

# Define commands to start our server
CMD [ "node", "server.js" ]