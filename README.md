# An X Forwarding Example for Docker

[![Build Status](https://travis-ci.org/justin-vanwinkle/Docker-XForward-Example.svg?branch=master)](https://travis-ci.org/justin-vanwinkle/Docker-XForward-Example)

* If you want to try it out, run `bin/demo xeyes`.
* The `tasks` folder is used for my build and release pipeline with Travis CI.
* The `bin` folder contains a script that spins up a docker container and proxys additional commands to the container.
* The most relevant files for X forwasding are `Dockerfile`, `entrypoint.sh`, and `bin/demo`.

## Known Issue

* Your working directory must be inside the host user's home directory.  Running outside in a directory higher than that will result in failure.
