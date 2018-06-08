#!/bin/sh

time docker image build kubernetes-tutorial:$(git rev-parse HEAD) .