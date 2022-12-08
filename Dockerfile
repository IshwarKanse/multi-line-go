FROM registry.access.redhat.com/ubi8/go-toolset
COPY multi-line-go.go .
RUN go mod init multi-line-go && \
    go mod tidy && \
    go build .

FROM registry.access.redhat.com/ubi8/ubi-micro
COPY --from=0 /opt/app-root/src/multi-line-go .
CMD ./multi-line-go
