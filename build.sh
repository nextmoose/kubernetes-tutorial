#!/bin/sh

time docker image build --tag kubernetes-tutorial:$(git rev-parse HEAD) .