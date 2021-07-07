# Docker Image for Environmental Data Science

Author: Dr. Zhonghua Zheng (zhonghua.zheng@outlook.com)

## Introduction

This Docker image is used for Environmental Data Science. It consists of:

- jupyter
- data processing
  - numpy
  - pandas
  - xarray (with netCDF4 support)
  - scipy
- machine learning
  - scikit-learn
  - PyTorch
  - LightGBM
  - XGBoost
- mapping & plotting:
  - Cartopy
  - matplotlib

## Usage

**Step 1: run a docker container**

- If you have your scripts (notebooks) and data in the same folder:

  ```bash
  $ cd your_scripts_folder
  $ docker run -it --rm -p 8888:8888 -v $PWD:/home envdes/env
  ```

- If you have your scripts (notebooks) and data in different folders (then you would have a folder "/data" after you running the container):

  ```bash
  $ cd your_scripts_folder
  $ docker run -it --rm -p 8888:8888 -v $PWD:/home -v /path_to_data_folder:/data envdes/env
  ```

**Step 2: open your browser, type "localhost:8888", copy the token from terminal (after "token=") and paste** 

- If you got the error such as 

  ```
  libgomp-d22c30c5.so.1.0.0: cannot allocate memory in static TLS block'
  ```

  Please import the following package(s) first

  ```Python
  import sklearn
  import torch
  import xgboost
  ```

  

