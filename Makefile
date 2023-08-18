VERSION=$(shell git describe --always --match "v[0-9]*" HEAD)
export VERSION

.DEFAULT_GOAL := all

all: mcpcol

.PHONY: genmcpcolconfig
genmcpcolconfig:
	envsubst < cmd/mcpcol/builder-config.template.yaml > cmd/mcpcol/builder-config.yaml


.PHONY: genmcpcol
genmcpcol: genmcpcolconfig
	builder --skip-compilation --config cmd/mcpcol/builder-config.yaml --output-path cmd/mcpcol

.PHONY: mcpcol
mcpcol: genmcpcolconfig
	builder --config cmd/mcpcol/builder-config.yaml --output-path dist

