# Towards Dynamic Resource Management with MPI Sessions and PMIx - Prototype Code
## Introduction
This repository provides setup scripts for the Dynamic MPI prototype developed in the context of the EuroHPC Time-X project. It consists of the following sub-projects:
* [MPI Extensions](https://gitlab.inria.fr/dynres/dyn-procs/ompi)
* [PMIx Extensions](https://gitlab.inria.fr/dynres/dyn-procs/openpmix)
* [PRRTE Extensions](https://gitlab.inria.fr/dynres/dyn-procs/prrte)
* [Test Applications](https://gitlab.inria.fr/dynres/dyn-procs/test_applications)
* [A simple python-based Dynamic Resource Manager](https://gitlab.inria.fr/dynres/dyn-procs/dyn_rm)

## Prerequisits

* [m4 >= 1.4.17 `OPCIONAL`](https://www.gnu.org/software/m4/)
* [autoconf >= 2.69](https://www.gnu.org/software/autoconf/autoconf.html)
* [automake >= 1.15](https://www.gnu.org/software/automake/)
* [libtool >= 2.4.6](https://www.gnu.org/software/libtool/)
* [flex >= 2.5.35](https://gnuwin32.sourceforge.net/packages/flex.htm)
* [hwloc >= 2.5](https://www.open-mpi.org/software/hwloc/v2.12/)
* [libevent >= 2.1.12](https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz)
* [zlib (recommended)](https://zlib.net/current/zlib.tar.gz)
* python3
* [cython](https://pypi.org/project/Cython/)

Building the benchmarks:
* scons 

## Compiling and Installing
 
### Environment variables
Before installing the projects, we need to export the required environment variables:
```
source env_vars.sh          --basedir [a base dir where dyn_procs software is installed]
                            --hwlocpath [path/to/hwloc]
                            --libeventpath [path/to/libevent]
                            --fabricpath [path/to/libfabric]
```

### Building the projects
There's a special compile script automizing many steps of the installation.
To build all projects run:

`./install.sh all`

It is also possible to build the projects individually:

`./install.sh openpmix` (Builds the OpenPMIx project)

`./install.sh prrte` (Builds the PRRTE project)

`./install.sh ompi` (Builds the OMPI project)

`./install.sh tests` (Builds the test applications)

`./install.sh dyn_rm` (Builds the Dynamic Resource Manager project)

Note the dependecies chain: tests -> ompi -> prrte -> openpmix


## Contact
In case of any questions please contact me via email: `domi.huber@tum.de`


