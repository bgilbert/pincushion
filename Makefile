.PHONY: start
start:
	podman play kube pod.yml

.PHONY: stop
stop:
	podman pod stop pincushion
	podman pod rm pincushion

.PHONY: client
client:
	podman run --pod pincushion -ti --rm docker://synadia/nats-box:latest
