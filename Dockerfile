#step 1
FROM alpine

#step: install a software. apk is apt get. 
# RUN apk add binutils
# RUN apk add someImage

# in the below 2 steps we specify which linux to be used. these are important. these are not installation of software. 
# ''>>''  means take input from repo echo and insert that into a file . (i.e) repositories. alpine linux doesnt know how to get mongodb. 
# these linux go into the repo and look for the software.
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories 
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories

RUN apk update

# we need to have a mongodb with version and it should be updated. that is what the above and below lines are. r0 means revision 0
# skipping the version will result in the latest version of the software 
RUN apk add mongodb=3.4.4-r0


#step 2.5: configure the software. how we expect the services to serve us. where it needs to run and work. 
VOLUME [ "/data/data" ]

WORKDIR /data

# it is the most used port. 
EXPOSE 27017




# step 3: set default commands
# i want to start a daemin in mongo servcie. that is what below line is. 
CMD [ "mongod" ]

# yes , we have wrote 8 different lines and the container is created and deleted for 8 times. except from alpine, which is the first line.