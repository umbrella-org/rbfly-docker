Docker image with RbFly
=======================

Ready to use Docker image that comes with [RbFly](https://gitlab.com/wrobell/rbfly)
and [uv](https://github.com/astral-sh/uv) preinstalled.

Build image and push to the [Docker Hub](https://hub.docker.com/repository/docker/codcod66/rbfly):

    $ make build
    $ make push

Settings for the build process are in `.env` file.

Before pushing the image to the registry make sanity check if the image was
built with

    $ docker image ls |grep rbfly

To play around with the image type in `./run.sh bash`. This command builds
a temporary image and starts the Bash shell inside.

    $ ./run.sh bash
    root@2042644d1d72:/# uv version
    uv 0.4.9
    root@2042644d1d72:/# python -c "import rbfly; print(rbfly.__version__)"
    0.9.0
