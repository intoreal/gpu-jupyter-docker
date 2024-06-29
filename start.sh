[ ! -d "work" ] && mkdir work
docker run --name gpu-jupyter-docker --gpus all -d -it -p 8848:8888 -v $(pwd)/work:/home/jovyan/work -e GRANT_SUDO=yes -e JUPYTER_ENABLE_LAB=yes --user root cschranz/gpu-jupyter:v1.7_cuda-12.2_ubuntu-22.04
