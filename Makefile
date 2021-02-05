RELEASE=

.PHONY: start
start:
	podman play kube debug.yml

.PHONY: stop
stop:
	podman pod stop pincushion
	podman pod rm pincushion

.PHONY: client
client:
	podman run --pod pincushion -ti --rm docker://synadia/nats-box:latest

.PHONY: rs
rs:
ifneq ($(RELEASE),)
	cd rs && cargo clean
	podman build -f Containerfile.release -t pincushion-rs:latest $@
else
	cd rs && cargo build
	podman build -f Containerfile.debug -t pincushion-rs:latest $@
endif
