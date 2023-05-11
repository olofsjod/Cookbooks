# Install notes of MEEP
written by Olof Sjödin <olsj@kth.se> 2023-05-10.

## On local computer

To install conda, download this script:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

Then to start the text based installer:
```
bash Miniconda3-latest-Linux-x86_64.sh
```

Accept the EULA. Then, it will ask you the installation location:

```
[- clip -]

Miniconda3 will now be installed into this location:
/cfs/klemming/home/o/olsj/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/cfs/klemming/home/o/olsj/miniconda3] >>> 
```
It's alright here to press enter. To activate conda run:

```
eval "$(/cfs/klemming/home/o/olsj/miniconda3/bin/conda shell.bash hook)"

```

To install parallel meep:

```
conda create -n pmp -c conda-forge mayavi vispy scikit-image pymeep=*=mpi_mpich_* pymeep-extras=*=mpi_mpich_*
```

To install Jupyter Notebook:

```
conda install -c conda-forge notebook nb_conda_kernels jupyter_contrib_nbextensions
```

Which then can be started with:

```
jupyter notebook
```

## On PDC

Log into PDC using SSH. Then, we need to install Anaconda by downloading this script:
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

Then to start the text based installer:
```
bash Miniconda3-latest-Linux-x86_64.sh
```

Accept the EULA. Then, it will ask you the installation location:

```
[- clip -]

Miniconda3 will now be installed into this location:
/cfs/klemming/home/o/olsj/miniconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/cfs/klemming/home/o/olsj/miniconda3] >>> /cfs/klemming/projects/snic/snicYYYY-XX-ZZZ/miniconda3
```

I would install miniconda in `/cfs/klemming/` since it is supposed to be the faster storage area (see https://www.pdc.kth.se/support/documents/data_management/klemming.html).

To activate conda one can run:

```
eval "$(/cfs/klemming/projects/snic/snicYYYY-XX-ZZZ/miniconda3/bin/conda shell.bash hook)"

```

To install Parallell MEEP, use the following installation sequence (https://meep.readthedocs.io/en/latest/Installation/):
```
conda create -n pmp -c conda-forge mayavi vispy scikit-image pymeep=*=mpi_mpich_* pymeep-extras=*=mpi_mpich_*
```

To activate the Python environment run:
```
conda activate pmp
```
