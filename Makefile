.PHONY: build clean deploy

build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/hello cmd/handlers/hello/main.go
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/world cmd/handlers/world/main.go

clean:
	rm -rf ./bin

deploy: clean build
	sls deploy --verbose --aws-profile admin

web:
	yarn dev