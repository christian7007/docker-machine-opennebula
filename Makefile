GODEP_BIN := $(GOPATH)/bin/dep

default: build

bin/docker-machine-driver-opennebula:
	$(GODEP_BIN) init
	$(GODEP_BIN) ensure  
	go build -o ./bin/docker-machine-driver-opennebula ./bin
build: clean bin/docker-machine-driver-opennebula

clean:
	$(RM) bin/docker-machine-driver-opennebula

install: bin/docker-machine-driver-opennebula
	cp -f ./bin/docker-machine-driver-opennebula $(GOPATH)/bin/

.PHONY: clean build install
