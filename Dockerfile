FROM python:3.9

WORKDIR /app/
ENV PYTHONPATH="/app/"
ENV MONGO_HOST="172.17.0.2"
ENV MONGO_PORT="27017"
ENV MONGO_USER=""
ENV MONGO_PASSWORD=""
ENV REPLICASET_NAME=""
ENV ML_PROJECT_DIR="torah_ner"
ENV GPU_ID=-1
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
WORKDIR prodigy_scripts/prodigy_utils/
RUN python setup.py develop
WORKDIR /app/

ENTRYPOINT [ "python", "util/job.py" ]