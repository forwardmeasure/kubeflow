# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM forwardmeasure/tensorflow-2.4.0-gpu-kf-jupyter:latest

ENV APP_HOME /app
WORKDIR $APP_HOME

# Copy local code to container image
COPY KFServing_BERT_QA_ModelServer.py ./

CMD ["python", "KFServing_BERT_QA_ModelServer.py"]
