FROM golang:1.17 AS build
ENV GOPROXY=https://proxy.golang.com.cn,direct
WORKDIR /
COPY . .
RUN CGO_ENABLED=0 go get -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv
RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o ./app

FROM alpine
WORKDIR /
COPY . .
COPY --from=build /go/bin/dlv dlv
COPY --from=build /app app
ENTRYPOINT [ "/dlv" , "--listen=:40000", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/app"]]
