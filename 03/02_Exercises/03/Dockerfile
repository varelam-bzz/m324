# Base image is node-version 18.17.1
FROM node:18.17.1

# update OS, install bash and clean all installation files
RUN apt-get update && \
    apt-get install -y bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# create directory server and ...
RUN mkdir -p /server

# set it as working directory
WORKDIR /server

# copy all local files in the backend into
# working directory
COPY backend/ .

# install all nodejs dependencies
RUN npm install

# expose port 3000 of the app
EXPOSE 3000

# run server
CMD ["node", "index.js"]

