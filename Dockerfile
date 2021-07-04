FROM arm64v8/ubuntu

ENV CONDA_DIR=/opt/conda
ENV PATH=${CONDA_DIR}/bin:${PATH}
ENV TZ=America/New_York

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt update \
    && apt install -y \
        wget \
        gcc \
        libnetcdf-dev \
        libgomp1 \
        libproj-dev \ 
        libgeos-dev \
        proj-data \ 
        proj-bin \ 
        g++ \
    && wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O ~/miniforge3.sh \
    && bash ~/miniforge3.sh -b -p $CONDA_DIR \
    && echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate base" >> /etc/skel/.bashrc \
    && echo ". ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate base" >> ~/.bashrc \
    && /bin/bash \
    && rm ~/miniforge3.sh \
    && conda install -y -c conda-forge \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        xarray \
        jupyter \
        matplotlib \
        lightgbm \
    && pip --no-cache-dir install \ 
        netCDF4 \
        cartopy \
        torch \
        torchvision \
    && conda clean --all 

CMD ["jupyter", "notebook", "--port=8888", "--no-browser",  "--ip=0.0.0.0", "--notebook-dir=/home", "--allow-root"]

# ==============
# reference
# timezone: https://github.com/UW-GAC/docker/blob/master/ubuntu-18.04-hpc.dfile
# docker build: https://github.com/conda-forge/miniforge-images/blob/master/ubuntu/Dockerfile
# ==============

# error of XGBoost installation
# XGBoostError: XGBoost Library (libxgboost.so) could not be loaded.
# Likely causes:
#   * OpenMP runtime is not installed (vcomp140.dll or libgomp-1.dll for Windows, libomp.dylib for Mac OSX, libgomp.so for Linux and other UNIX-like OSes). Mac OSX users: Run `brew install libomp` to install OpenMP runtime.
#   * You are running 32-bit Python on a 64-bit OS
# Error message(s): ['/opt/conda/lib/python3.9/site-packages/xgboost/lib/../../xgboost.libs/libgomp-d22c30c5.so.1.0.0: cannot allocate memory in static TLS block']

#==============
# useful commands
# docker build -t envdes/env .
# docker run -it --rm -p 8888:8888 -v $PWD:/home envdes/env
# docker run -it --rm -p 8888:8888 -v $PWD:/home -v /path_to_data_folder:/data envdes/env
# docker push envdes/env