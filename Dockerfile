FROM jupyter/scipy-notebook

LABEL maintainer="Stefan Klikovits <stefan@klikovits.net>"

USER root

# install (patched) z3
RUN git clone https://github.com/stklik/z3.git
WORKDIR z3
RUN python scripts/mk_make.py --python
RUN cd build && make
RUN cd build && make install
WORKDIR ..
RUN rm -rf z3   # cleanup

USER $NB_USER
