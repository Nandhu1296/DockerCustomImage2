#step 1
FROM alpine

#step: install a software. apk is apt get. 
RUN apk add binutils
RUN apk add someImage


#step 2.5: configure the software

# step 3: set default commands