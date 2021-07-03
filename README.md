# Docker Image for Environmental Data Science

Author: Dr. Zhonghua Zheng (zhonghua.zheng@outlook.com)

## Introduction

This Docker image is used for Environmental Data Science. It consists of:

- numpy, pandas, scipy, xarray (with netCDF4 support)
- jupyter
- scikit-learn, pytorch
- matplotlib

## Usage

**Step 1: run a docker container**

- If you have your scripts (notebooks) and data in the same folder:

  ```bash
  $ cd your_scripts_folder
  $ docker run -it --rm -p 8888:8888 -v $PWD:/home zzheng93/ml
  ```

- If you have your scripts (notebooks) and data in different folders (then you would have a folder "/data" after you running the container):

  ```bash
  $ cd your_scripts_folder
  $ docker run -it --rm -p 8888:8888 -v $PWD:/home -v /path_to_data_folder:/data zzheng93/ml
  ```

**Step 2: open your browser, type "localhost:8888", copy the token from terminal (after "token=") and paste** 

