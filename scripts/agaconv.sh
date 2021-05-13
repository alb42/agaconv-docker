#!/bin/bash
docker run -it -v $PWD:/data -w /data alb42/agaconv agaconv $@
