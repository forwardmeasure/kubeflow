#!/bin/bash

docker push forwardmeasure/data_downloader:0.1
docker push forwardmeasure/tfidf_vectorizer:0.1
docker push forwardmeasure/spacy_tokenizer:0.1
docker push forwardmeasure/lr_text_classifier:0.1
docker push forwardmeasure/clean_text_transformer:0.1
