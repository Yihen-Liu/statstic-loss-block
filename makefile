VERSION := $(shell git rev-parse --short HEAD)
BUILDTIME := $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')

GOLDFLAGS += -X main.Version=v-$(VERSION)
GOLDFLAGS += -X main.BuildTime=$(BUILDTIME)
GOFLAGS = -ldflags "$(GOLDFLAGS)"


linux-amd64:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/go-trias-cache-linux-amd64 $(GOFLAGS) .

linux-arm64:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o ./bin/go-trias-cache-linux-arm64 $(GOFLAGS) .

darwin-arm64:
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -o ./bin/go-trias-cache-darwin-arm64 $(GOFLAGS) .

darwin-amd64:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -buildvcs=false -o ./bin/go-trias-cache-darwin-amd64 $(GOFLAGS) .

windows-amd64:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o ./bin/go-trias-cache-windows-amd64 $(GOFLAGS) .

test:
	go test -v ./...
clean:
	rm -f bin/go-cache-*
	rm -fr ./bin/logs/*.log
all: linux-amd64 linux-arm64 darwin-arm64 darwin-amd64 windows-amd64
	