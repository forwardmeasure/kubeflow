from typing import NamedTuple

import kfp
import kfp.components as components
import kfp.dsl as dsl
import kubeflow.fairing.utils

from kfp.components import InputPath, OutputPath

NAMESPACE = kubeflow.fairing.utils.get_current_k8s_namespace()
print (NAMESPACE)
kfserving = components.load_component_from_file("kfserving-component.yaml")
print (kfserving)
BASE_IMAGE = "mesosphere/kubeflow:1.0.1-0.6.0-tensorflow-2.2.0"
INPUT_BUCKET = "pipelines-tutorial-data"
EXPORT_BUCKET = "pipelines-tutorial-model"

