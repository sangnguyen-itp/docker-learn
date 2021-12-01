FROM golang:alpine

WORKDIR /

ARG ENV
ARG PORT
ENV env=$ENV
ENV app_port=$PORT

COPY ./config.$ENV.env /.env
COPY ./go.mod /go.mod
COPY ./go.sum /go.sum
RUN go mod download

COPY *.go .
RUN go build -o /app

COPY health.sh /health.sh
RUN chmod +x /health.sh
HEALTHCHECK --interval=5s \
            --timeout=1s \
            CMD ["/health.sh"]

EXPOSE $PORT

CMD ["/app"]
