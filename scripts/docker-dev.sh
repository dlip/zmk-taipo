#!/usr/bin/env bash
docker run -it \
	--name zmk-taipo-dev \
	--network host \
	--privileged \
	-v /dev:/dev \
	-v zmk:/workspaces/zmk \
	-v $PWD:/workspaces/zmk-taipo \
  -v $PWD/.build:/workspaces/zmk/app/build \
  -w /workspaces/zmk-taipo \
	zmk-taipo:latest \
	/bin/bash
