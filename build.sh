#!/bin/sh

time sudo docker image build --tag kubernetes-tutorial:$(git rev-parse HEAD) .