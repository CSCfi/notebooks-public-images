FROM jupyter/minimal-notebook

LABEL org.opencontainers.image.authors="CSC Notebooks Team <notebooks-admin@csc.fi>"

USER root

ENV HOME /home/$NB_USER

RUN echo "ssh-client and less from apt" \
    && apt-get update \
    && apt-get install -y ssh-client less \
    && apt-get clean

RUN echo "graphviz from apt" \
    && apt-get update \
    && apt-get install -y graphviz \
    && apt-get clean

USER $NB_USER

RUN echo "upgrade pip and setuptools" \
    && pip --no-cache-dir install --upgrade pip setuptools

RUN echo "Tensorflow" \
    && pip --no-cache-dir install tensorflow

RUN echo "Scikit-Learn" \
    && pip --no-cache-dir install scikit-learn

RUN echo "PyTorch, TorchVision and ipywidgets" \
    && pip --no-cache-dir install torch torchvision torchaudio torchtext \
       --extra-index-url https://download.pytorch.org/whl/cpu \
    && pip --no-cache-dir install ipywidgets==7.5.1

RUN echo "Xgboost" \
    && pip --no-cache-dir install xgboost

RUN echo "Scikit-Image" \
    && pip --no-cache-dir install scikit-image

RUN echo "Graphviz" \
    && pip --no-cache-dir install graphviz

RUN echo "Keras" \
    && pip --no-cache-dir install PyYAML seaborn keras \
    && true

RUN echo "MNIST image database prepopulation" \
    && mkdir -p ~/.keras/datasets/ \
    && wget https://s3.amazonaws.com/img-datasets/mnist.pkl.gz -O ~/.keras/datasets/mnist.pkl.gz

RUN echo "pydot and pydot-ng" \
    && pip --no-cache-dir install pydot pydot-ng\
    && true
