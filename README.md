About oommf-feedstock
=====================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/oommf-feedstock/blob/main/LICENSE.txt)

Home: http://math.nist.gov/oommf/

Package license: Custom

Summary: Object Oriented MicroMagnetic Framework (OOMMF)

Development: https://github.com/fangohr/oommf

Documentation: http://math.nist.gov/oommf/doc/

The Object Oriented MicroMagnetic Framework (OOMMF) forms a completely
functional micromagnetics package. OOMMF is written in C++. For portable user
interfaces, it uses Tcl/Tk so that OOMMF operates across a wide range of Unix,
Windows, and MacOS platforms.

The recipe for building this OOMMF conda package was developed by Martin Lang,
Thomas Kluyver, Ryan A. Pepper, Marijan Beg, and Hans Fangohr at the University
of Southampton, Max Planck Institute for the Structure and Dynamics of Matter,
European XFEL, and Imperial College London as a part of OpenDreamKit – Horizon
2020 European Research Infrastructure project (676541) and EPSRC Programme Grant
on Skyrmionics (EP/N032128/1).

This package contains Dzyaloshinskii-Moriya extensions for Cnv, T(O), and D2d
crystallographic classes as well as magneto-elastic energy term. These
extensions are not included in the OOMMF binaries and tarballs provided by NIST.
More information can be found at https://github.com/fangohr/oommf.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=4884&branchName=main">
            <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/oommf-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=4884&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/oommf-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=4884&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/oommf-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64</td>
              <td>
                <a href="https://dev.azure.com/conda-forge/feedstock-builds/_build/latest?definitionId=4884&branchName=main">
                  <img src="https://dev.azure.com/conda-forge/feedstock-builds/_apis/build/status/oommf-feedstock?branchName=main&jobName=win&configuration=win%20win_64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-oommf-green.svg)](https://anaconda.org/conda-forge/oommf) | [![Conda Downloads](https://img.shields.io/conda/dn/conda-forge/oommf.svg)](https://anaconda.org/conda-forge/oommf) | [![Conda Version](https://img.shields.io/conda/vn/conda-forge/oommf.svg)](https://anaconda.org/conda-forge/oommf) | [![Conda Platforms](https://img.shields.io/conda/pn/conda-forge/oommf.svg)](https://anaconda.org/conda-forge/oommf) |

Installing oommf
================

Installing `oommf` from the `conda-forge` channel can be achieved by adding `conda-forge` to your channels with:

```
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Once the `conda-forge` channel has been enabled, `oommf` can be installed with `conda`:

```
conda install oommf
```

or with `mamba`:

```
mamba install oommf
```

It is possible to list all of the versions of `oommf` available on your platform with `conda`:

```
conda search oommf --channel conda-forge
```

or with `mamba`:

```
mamba search oommf --channel conda-forge
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search oommf --channel conda-forge

# List packages depending on `oommf`:
mamba repoquery whoneeds oommf --channel conda-forge

# List dependencies of `oommf`:
mamba repoquery depends oommf --channel conda-forge
```


About conda-forge
=================

[![Powered by
NumFOCUS](https://img.shields.io/badge/powered%20by-NumFOCUS-orange.svg?style=flat&colorA=E1523D&colorB=007D8A)](https://numfocus.org)

conda-forge is a community-led conda channel of installable packages.
In order to provide high-quality builds, the process has been automated into the
conda-forge GitHub organization. The conda-forge organization contains one repository
for each of the installable packages. Such a repository is known as a *feedstock*.

A feedstock is made up of a conda recipe (the instructions on what and how to build
the package) and the necessary configurations for automatic building using freely
available continuous integration services. Thanks to the awesome service provided by
[Azure](https://azure.microsoft.com/en-us/services/devops/), [GitHub](https://github.com/),
[CircleCI](https://circleci.com/), [AppVeyor](https://www.appveyor.com/),
[Drone](https://cloud.drone.io/welcome), and [TravisCI](https://travis-ci.com/)
it is possible to build and upload installable packages to the
[conda-forge](https://anaconda.org/conda-forge) [anaconda.org](https://anaconda.org/)
channel for Linux, Windows and OSX respectively.

To manage the continuous integration and simplify feedstock maintenance
[conda-smithy](https://github.com/conda-forge/conda-smithy) has been developed.
Using the ``conda-forge.yml`` within this repository, it is possible to re-render all of
this feedstock's supporting files (e.g. the CI configuration files) with ``conda smithy rerender``.

For more information please check the [conda-forge documentation](https://conda-forge.org/docs/).

Terminology
===========

**feedstock** - the conda recipe (raw material), supporting scripts and CI configuration.

**conda-smithy** - the tool which helps orchestrate the feedstock.
                   Its primary use is in the construction of the CI ``.yml`` files
                   and simplify the management of *many* feedstocks.

**conda-forge** - the place where the feedstock and smithy live and work to
                  produce the finished article (built conda distributions)


Updating oommf-feedstock
========================

If you would like to improve the oommf recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`conda-forge` channel, whereupon the built conda packages will be available for
everybody to install and use from the `conda-forge` channel.
Note that all branches in the conda-forge/oommf-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@davidcortesortuno](https://github.com/davidcortesortuno/)
* [@fangohr](https://github.com/fangohr/)
* [@lang-m](https://github.com/lang-m/)
* [@marijanbeg](https://github.com/marijanbeg/)
* [@samjrholt](https://github.com/samjrholt/)

