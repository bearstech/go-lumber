export GOPATH:=$(shell pwd)/gopath

all: tst-lj

tst-lj: gopath/src/github.com/elastic/go-lumber
	go build cmd/tst-lj/main.go

gopath/src/github.com/elastic/:
	mkdir -p gopath/src/github.com/elastic

gopath/src/github.com/elastic/go-lumber: gopath/src/github.com/elastic
	ln -sf $(shell pwd) gopath/src/github.com/elastic/go-lumber

vendor:
	glide install

clean:
	rm -rf vendor gopath
