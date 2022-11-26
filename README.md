# metapy: (experimental) Python bindings for [MeTA][meta]

[![Build Status](https://app.travis-ci.com/dmcguire81/metapy.svg?branch=master)](https://app.travis-ci.com/github/dmcguire81/metapy)

This project provides Python (2.7 and 3.x are supported) bindings for the
MeTA toolkit. They are still very much under construction, but the goal is
to make it seamless to use MeTA's components within any Python application
(e.g., a Django or Flask web app).

This project is made possible by the excellent [pybind11][pybind11]
library.

## Getting Started (Docker)

A [Docker](https://www.docker.com/) image with a pre-built version of MeTA and `metapy` is available on [Docker Hub](https://hub.docker.com/r/josecols/metapy/tags)

```bash
docker pull josecols/metapy:0.2.14
```

This Docker image simplifies the execution of Python scripts that rely on `metapy`. For example, to run CS 410 Text Information Systems MP assignments, simply run the following command at the MP directory's root.

```bash
docker run -it --rm --name metapy --mount type=bind,source=$(pwd),target=/app --entrypoint bash josecols/metapy:0.2.14
```

Then, you can run the Python scripts as usual, e.g., `python mp1.py`. Keep in mind that any changes to files in your current directory that occur within the container will be automatically reflected on your host file system.

## Getting Started (the easy way)

```bash
# Ensure your pip is up to date
pip install --upgrade pip

# install metapy!
pip install metapy
```

This should work on Linux, OS X, and Windows with pretty much any recent
Python version >= 2.7. On Linux, make sure to update your `pip` to version
8.1 so you can install from a binary package---this will save you a lot of
time.

## Getting Started (the hard way)

You will, of course, need Python installed. You will also need its headers
to be installed as well, so look for a `python-dev` or similar package for
your system. Beyond that, you'll of course need to satisfy the requirements
for [building MeTA itself][build-guide].

This repository should have everything you need to get started. You should
ensure that you've fetched all of the submodules first, though:

```bash
git submodule update --init --recursive
```

Once that's done, you should be able to build the library like so:

```bash
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
```

You can force building against a specific version of Python if you happen
to have multiple versions installed by specifying
`-DMETAPY_PYTHON_VERSION=x.y` when invoking `cmake`.

The module should be written to `metapy.so` in the build directory.

[meta]: https://meta-toolkit.org
[pybind11]: https://github.com/pybind/pybind11
[build-guide]: https://meta-toolkit.org/setup-guide.html
