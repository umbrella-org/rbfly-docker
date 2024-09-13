#!/usr/bin/env sh
#
# Build and run the example Docker image.
#
# The `docker run` command uses the following options:
#
#   --rm                        Remove the container after exiting
#   -it $(docker build -q .)    Build the image, then use it as a run target
#   $@                          Pass any arguments to the container

if [ -t 1 ]; then
    INTERACTIVE="-it"
else
    INTERACTIVE=""
fi

echo "Be patient please."

while read line; do args+="--build-arg $line "; done <<<"$(cat .env |sed 's:#.*$::g' |sed '/^$/d')"

docker run \
    --rm \
    $INTERACTIVE \
    $(docker build -q $args .) \
    "$@"
