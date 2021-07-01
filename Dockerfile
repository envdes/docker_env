FROM condaforge/miniforge3

RUN conda install -y \
        numpy \
        pandas \
        scipy \
        scikit-learn \
        xarray \
        jupyter \
        matplotlib \
    && pip --no-cache-dir install \ 
        torch \
        torchvision \
        xgboost \
    && conda clean --all 

CMD ["jupyter", "notebook", "--port=8888", "--no-browser",  "--ip=0.0.0.0", "--notebook-dir=/home", "--allow-root"]

# docker build -t zzheng93/ml .
# docker run -it --rm -p 8888:8888 -v $PWD:/home zzheng93/ml
# docker push zzheng93/ml