#!/bin/bash

s2i build . seldonio/seldon-core-s2i-python37:1.2.3 forwardmeasure/clean_text_transformer:0.1
