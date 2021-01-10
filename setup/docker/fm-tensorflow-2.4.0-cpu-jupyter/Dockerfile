FROM tensorflow/tensorflow:2.4.0-jupyter

# Install production dependencies.
COPY requirements.txt ./
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN pip install --no-cache-dir -r ./requirements.txt

ENV NB_PREFIX /

CMD ["sh","-c", "jupyter notebook --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
