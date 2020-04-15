FROM golang:1.7-alpine
ENV MONGO_HOST mytestdb:27017
ENV HATEAOS user
ENV USER_DATABASE mongodb
COPY . /go/src/github.com/microservices-demo/user
RUN apk update
RUN apk add git
RUN go get -v github.com/Masterminds/glide && cd /go/src/github.com/microservices-demo/user && glide install && go install
ENTRYPOINT user
EXPOSE 8085
