#!/bin/bash

s2i build . seldonio/seldon-core-s2i-python37:1.2.3 forwardmeasure/spacy_tokenizer:0.1
