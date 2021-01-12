#!/bin/bash

s2i build . seldonio/seldon-core-s2i-python37:1.2.3 forwardmeasure/lr_text_classifier:0.1
