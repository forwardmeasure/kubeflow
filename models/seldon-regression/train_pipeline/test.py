import importlib
import logging

import numpy as np
import spacy
from spacy.cli import download

download("en_core_web_sm")
importlib.reload(spacy)

nlp = spacy.load('en_core_web_sm', parser=False, entity=False)

print(nlp)
