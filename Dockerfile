# FROM tensorflow/tensorflow:1.4.1-devel-gpu-py3
FROM tensorflow/tensorflow:2.4.3-gpu

# RUN  apt update && apt install -y \
#     software-properties-common \
#     python python-pip

WORKDIR /waternet

# RUN pip install --upgrade pip
# Many libs already incldued with the docker image, they have been commented-out of requirements.txt
COPY ./requirements-tf2docker.txt ./requirements.txt
RUN pip3 install -r requirements.txt

VOLUME ["/samples"]
VOLUME ["/data"]
VOLUME ["/checkpoint"]
COPY ./ /waternet

# CMD ["python", "run-headless.py", "/data", "/results"]
CMD ["python3", "./testing_code_by_Branimir Ambrekovic/main_test2.py", "-sample_dir=/samples",\
    "-checkpoint_dir=/checkpoint", "-test_data_dir=/data"]
