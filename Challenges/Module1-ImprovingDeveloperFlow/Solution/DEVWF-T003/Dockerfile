# This is the base image that can be used
FROM node:argon  
# This is the directory within the container where commands will be executed
WORKDIR /usr/src/app 
# Copy the package json file to the workdir
COPY package.json /usr/src/app/
# This is the port that the container exposes
EXPOSE 3001
# Run the NPM install command to build the application
RUN npm install
# Copy the rest of the sources
COPY . /usr/src/app
# Start the application
CMD [ "npm", "start" ]