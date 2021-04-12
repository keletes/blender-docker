FROM python:3.7

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN apt -y install \
build-essential \
libreadline-gplv2-dev \
libncursesw5-dev \
libssl-dev \
libsqlite3-dev tk-dev \
libgdbm-dev libc6-dev \
libbz2-dev libffi-dev \
zlib1g-dev libx11-dev \
libxxf86vm-dev \
libxcursor-dev \
libxi-dev \
libxrandr-dev \
libxinerama-dev \
libglew-dev \
xvfb

RUN pip install -U python-dotenv wheel future-fstrings

ADD https://github.com/TylerGubala/blenderpy/releases/download/v2.91a0/bpy-2.91a0-cp37-cp37m-manylinux2014_x86_64.whl bpy-2.91a0-cp37-cp37m-manylinux2014_x86_64.whl
RUN python -m pip install bpy-2.91a0-cp37-cp37m-manylinux2014_x86_64.whl && python /usr/local/bin/bpy_post_install
RUN rm -Rf bpy-2.91a0-cp37-cp37m-manylinux2014_x86_64.whl
