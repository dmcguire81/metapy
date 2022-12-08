# metapy: (experimental) Python bindings for [MeTA][meta]

This fork of [metapy](https://github.com/meta-toolkit/metapy) aims to simplify the maintenance of the project
for its use in CS 410 Text Information Systems at
the [University of Illinois at Urbana-Champaign](https://cs.illinois.edu/). Thus, a containerized version of `metapy`,
Python wheels, and Google Colab notebooks are provided instead of the original installation instructions for each
platform. The container, based on [Ubuntu 22.04 LTS](https://hub.docker.com/_/ubuntu/), includes a pre-built version
of [MeTA][meta] and [metapy][metapy] with support for `amd64` and `arm64` architectures.

---

[![Build Status](https://app.travis-ci.com/illinois/metapy.svg?branch=master)](https://app.travis-ci.com/github/illinois/metapy)

This project provides Python (3.7 - 3.10 are supported) bindings for the
MeTA toolkit. They are still very much under construction, but the goal is
to make it seamless to use MeTA's components within any Python application
(e.g., a Django or Flask web app).

This project is made possible by the excellent [pybind11][pybind11] library.

## Getting Started

### Docker

A [Docker](https://www.docker.com/) image with a pre-built version of MeTA and `metapy` is available
on [Docker Hub](https://hub.docker.com/repository/docker/josecols/metapy/tags).

```bash
docker pull josecols/metapy:0.2.14
```

This Docker image simplifies the execution of Python scripts that rely on `metapy`. For example, to run CS 410 Text
Information Systems MP assignments, simply run the following command at the MP directory's root.

```bash
docker run -it --rm --name metapy --mount type=bind,source=$(pwd),target=/app --entrypoint bash josecols/metapy:0.2.14
```

Then, you can run the Python scripts as usual, e.g., `python mp1.py`. Keep in mind that any changes to files in your
current directory that occur within the container will be automatically reflected on your host file system.

#### Example for [MP1](https://github.com/CS410Assignments/MP1)

Clone the MP1 repository using Git.

```bash
# Use your own MP1 repository
git clone git@github.com:CS410Assignments/MP1.git
```

Run the Docker container using the `MP1` directory as the working directory.

```bash
cd MP1/
docker run -it --rm --name metapy --mount type=bind,source=$(pwd),target=/app --entrypoint bash josecols/metapy:0.2.14
```

Install other dependencies, if needed.

```bash
# (inside the container). The `pytoml` package is needed for MP1
pip install pytoml
```

Run the Python script.

```bash
# (inside the container)
python example.py
```

### Python Wheel

Download the latest wheel from the [releases page](https://github.com/illinois/metapy/releases) corresponding to your
Python and OS version. Then, install the wheel using `pip`:

```bash
# Ensure your pip is up to date
pip install --upgrade pip

# For Python 3.8 and Linux (x86_64)
pip install https://github.com/illinois/metapy/releases/download/v0.2.14/metapy-0.2.14-cp38-cp38-manylinux_2_24_x86_64.whl
```

### Jupyter Notebook

A series of tutorials using Jupyter Notebooks is provided in the [tutorials](tutorials) directory. To run the tutorials,
you will need to install Jupyter Notebook and `metapy` (see above). Alternatively, each tutorial can be opened
using [Google Colab][colab].

[meta]: https://meta-toolkit.org

[metapy]: https://pypi.org/project/metapy

[pybind11]: https://github.com/pybind/pybind11

[colab]: https://colab.research.google.com
