VERSION=$(shell git describe --always --match "v[0-9]*" HEAD)
export VERSION

.DEFAULT_GOAL := all

all: mcpcol

.PHONY: genmcpcol
mcpcol:
	envsubst < cmd/mcpcol/builder-config.template.yaml > cmd/mcpcol/builder-config.yaml
	builder --config cmd/mcpcol/builder-config.yaml --output-path dist

